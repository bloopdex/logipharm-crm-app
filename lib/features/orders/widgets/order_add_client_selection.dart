import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/search/search_cubit.dart';
import '../../../models/person/person.dart';
import '../../../shared/widgets/image/svg.dart';
import '../../../shared/widgets/inputs/search.text.field.widget.dart';
import '../../clients/clients.page.dart';
import '../../tour-plan/bloc/clients/clients_cubit.dart';

class OrderAddClientSelection extends StatefulWidget {
  const OrderAddClientSelection({super.key});

  @override
  State<OrderAddClientSelection> createState() =>
      _OrderAddClientSelectionState();
}

class _OrderAddClientSelectionState extends State<OrderAddClientSelection> {
  List<Person> clients = [];
  List<Person> filtered = [];

  @override
  void initState() {
    super.initState();
    final initial = context.read<ClientsCubit>().state.maybeWhen(
          orElse: () => <Person>[],
          loaded: (all, filter) => all,
        );
    clients = _applyBusinessRules(initial);
    filtered = clients;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.clients,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SearchCubit, String>(
            listener: (context, state) {
              _applySearch(state);
            },
          ),
          BlocListener<ClientsCubit, ClientsState>(
            listener: (context, state) {
              state.maybeWhen(
                loaded: (all, filter) {
                  clients = _applyBusinessRules(all);
                  _applySearch(context.read<SearchCubit>().state);
                },
                orElse: () {},
              );
            },
          ),
        ],
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
                ),
                SizedBox(height: kSpacingX2),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (filtered.isEmpty) {
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
                                context.i10n.tourEmptyPlans,
                                style: context.textTheme.headlineMedium,
                              ),
                              SizedBox(height: kSpacingX2),
                              Text(
                                context.i10n.tourEmptyPlansDescription,
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          await context.read<ClientsCubit>().load();
                        },
                        child: ListView.separated(
                          itemCount: filtered.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: kSpacingX3),
                          itemBuilder: (context, index) {
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
