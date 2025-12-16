import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/search/search_cubit.dart';
import '../../models/person/person.dart';
import '../../shared/widgets/image/svg.dart';
import '../../shared/widgets/inputs/search.text.field.widget.dart';
import '../clients/clients.page.dart';
import '../tour-plan/bloc/clients/clients_cubit.dart';

class AddClientSelection extends StatefulWidget {
  const AddClientSelection({super.key});

  @override
  State<AddClientSelection> createState() => _AddClientSelectionState();
}

class _AddClientSelectionState extends State<AddClientSelection> {
  List<Person> clients = [];

  @override
  void initState() {
    clients = context.read<ClientsCubit>().state.maybeWhen(
          orElse: () => [],
          loaded: (all, filter) => all,
        );
    super.initState();
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
              setState(() {
                clients = context.read<ClientsCubit>().state.maybeWhen(
                      orElse: () => [],
                      loaded: (all, filter) => clients.where((element) {
                        return element.fullName
                            .toLowerCase()
                            .contains(state.toLowerCase());
                      }).toList(),
                    );
              });
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
                      if (clients.isEmpty) {
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
                          context.read<ClientsCubit>().load();
                        },
                        child: ListView.separated(
                          itemCount: clients.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: kSpacingX3),
                          itemBuilder: (context, index) {
                            return ClientCard(
                              client: clients[index],
                              showDetails: false,
                              onPressed: () {
                                Navigator.of(context).pop(clients[index]);
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
