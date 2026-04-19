import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/person/person.dart';
import '../../../shared/widgets/image/svg.dart';
import '../../../shared/widgets/inputs/search.text.field.widget.dart';
import '../../clients/clients.page.dart';
import '../services/order_client_repository.dart';
import '../../tour-plan/bloc/clients/clients_cubit.dart';

class OrderAddClientSelection extends StatefulWidget {
  const OrderAddClientSelection({super.key});

  @override
  State<OrderAddClientSelection> createState() =>
      _OrderAddClientSelectionState();
}

class _OrderAddClientSelectionState extends State<OrderAddClientSelection> {
  static const int _pageSize = 20;

  List<Person> clients = [];
  List<Person> filtered = [];
  final ScrollController _scrollController = ScrollController();
  bool _isDelegateRestricted = false;
  bool _isInitialLoading = false;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;
  int _nextPage = 0;
  String _searchTerm = '';
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _isDelegateRestricted = _checkIfDelegateRestricted();

    if (_isDelegateRestricted) {
      _scrollController.addListener(_onScroll);
      _loadOrderClients(reset: true);
      return;
    }

    final initial = context.read<ClientsCubit>().state.maybeWhen(
          orElse: () => <Person>[],
          loaded: (all, filter) => all,
        );
    clients = _applyBusinessRules(initial);
    filtered = clients;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _checkIfDelegateRestricted() {
    try {
      return context.user.delegueType == 1;
    } catch (_) {
      return false;
    }
  }

  void _onScroll() {
    if (!_isDelegateRestricted) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadOrderClients();
    }
  }

  List<Person> _applyBusinessRules(List<Person> source) {
    return source.where((client) {
      if (client.typeTier == '14') return false;
      final stats = client.clientStatistics;
      if (stats == null) return true;
      return stats.commercialBlockage != true;
    }).toList();
  }

  void _applySearch(String query) {
    final normalized = query.toLowerCase();
    setState(() {
      filtered = clients
          .where((client) => client.fullName.toLowerCase().contains(normalized))
          .toList();
    });
  }

  void _onSearchChanged(String query) {
    _searchTerm = query.trim();
    if (_isDelegateRestricted) {
      _loadOrderClients(reset: true);
      return;
    }
    _applySearch(_searchTerm);
  }

  Future<void> _loadOrderClients({bool reset = false}) async {
    if (!_isDelegateRestricted) return;

    if (reset) {
      if (mounted) {
        setState(() {
          _isInitialLoading = true;
          _errorMessage = null;
          _hasMoreData = true;
          _nextPage = 0;
          clients = [];
          filtered = [];
        });
      }
    } else {
      if (_isInitialLoading || _isLoadingMore || !_hasMoreData) return;
      if (mounted) {
        setState(() {
          _isLoadingMore = true;
          _errorMessage = null;
        });
      }
    }

    try {
      final response = await OrderClientRepository.get(
        page: _nextPage,
        size: _pageSize,
        searchTerm: _searchTerm,
      );

      if (response.statusCode == 200) {
        final body = response.data['body'] as Map<String, dynamic>? ?? {};
        final data = body['data'] as List<dynamic>? ?? <dynamic>[];

        final pageClients = data
            .map((item) => Person.fromJson(item as Map<String, dynamic>))
            .toList();
        final validClients = _applyBusinessRules(pageClients);

        final totalPages = (body['totalPages'] as num?)?.toInt() ?? 0;
        final currentPage = (body['currentPage'] as num?)?.toInt() ?? _nextPage;

        if (!mounted) return;
        setState(() {
          if (reset) {
            clients = validClients;
          } else {
            final merged = [...clients, ...validClients];
            final keys = <String>{};
            clients = merged.where((client) {
              final key = '${client.companyId}-${client.typeTier}-${client.id}';
              if (keys.contains(key)) return false;
              keys.add(key);
              return true;
            }).toList();
          }

          filtered = clients;
          _nextPage = currentPage + 1;
          _hasMoreData = _nextPage < totalPages;
          _errorMessage = null;
        });
      } else {
        if (!mounted) return;
        setState(() {
          if (reset) {
            clients = [];
            filtered = [];
            _hasMoreData = false;
          }
          _errorMessage = context.i10n.noClientsFound;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        if (reset) {
          clients = [];
          filtered = [];
          _hasMoreData = false;
        }
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isInitialLoading = false;
          _isLoadingMore = false;
        });
      }
    }
  }

  Widget _buildEmptyState(
      BuildContext context, String title, String description) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SVG(
            'empty-states/info.svg',
            height: 175.h,
          ),
          SizedBox(height: kSpacingX3),
          Text(
            title,
            style: context.textTheme.headlineMedium,
          ),
          SizedBox(height: kSpacingX2),
          Text(
            description,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.clients,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: BlocListener<ClientsCubit, ClientsState>(
        listenWhen: (previous, current) => !_isDelegateRestricted,
        listener: (context, state) {
          if (_isDelegateRestricted) return;

          state.maybeWhen(
            loaded: (all, filter) {
              clients = _applyBusinessRules(all);
              _applySearch(_searchTerm);
            },
            orElse: () {},
          );
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
            constraints: BoxConstraints(
              minHeight:
                  context.height - context.appBarSize - context.paddingBottom,
              maxHeight:
                  context.height - context.appBarSize - context.paddingBottom,
              minWidth: context.width,
              maxWidth: context.width,
            ),
            child: Column(
              children: [
                SearchTextField(
                  hintText: context.i10n.clientName,
                  onChanged: _onSearchChanged,
                ),
                SizedBox(height: kSpacingX2),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (_isDelegateRestricted && _isInitialLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (filtered.isEmpty && _errorMessage != null) {
                        return _buildEmptyState(
                          context,
                          context.i10n.noClientsFound,
                          _errorMessage!,
                        );
                      }

                      if (filtered.isEmpty) {
                        return _buildEmptyState(
                          context,
                          context.i10n.noClientsFound,
                          context.i10n.tourCreationClientEmptyDescription,
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          if (_isDelegateRestricted) {
                            await _loadOrderClients(reset: true);
                          } else {
                            await context.read<ClientsCubit>().load();
                          }
                        },
                        child: ListView.separated(
                          controller: _scrollController,
                          itemCount: filtered.length +
                              (_isDelegateRestricted && _isLoadingMore ? 1 : 0),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: kSpacingX3),
                          itemBuilder: (context, index) {
                            if (_isDelegateRestricted &&
                                index == filtered.length) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            return ClientCard(
                              client: filtered[index],
                              showDetails: false,
                              onPressed: () {
                                Navigator.of(context).pop(filtered[index]);
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
