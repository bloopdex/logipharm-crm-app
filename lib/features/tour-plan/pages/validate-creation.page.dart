import 'package:crm/features/clients/clients.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../models/person/person.dart';
import '../bloc/clients/clients_cubit.dart';
import '../bloc/delegate_cubit.dart';
import '../bloc/tour-creation/tour_creation_cubit.dart';

class ValidateCreationPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ValidateCreationPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print("Data $data");
    // get the delegate from the cubit by delegate id
    final delegate = context
        .read<DelegateCubit>()
        .state
        .firstWhere((element) => element.id.toString() == data['delegueId']);

    // get the clients from the cubit by pharmacy id
    final clients = context.read<ClientsCubit>().state.maybeWhen(
        orElse: () => [],
        loaded: (all, filter) => all
            .where((element) =>
                data['pharmacieIds']?.contains('${element.id.toString()}:${element.typeTier}'))
            .toList());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<TourCreationCubit, TourCreationState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                failure: (message) => Container(
                    padding: EdgeInsets.all(kPaddingMd2),
                    margin: EdgeInsets.only(bottom: kSpacingX6),
                    decoration: BoxDecoration(
                      color: kCardinal.shade100,
                      borderRadius: BorderRadius.circular(kSpacingX3),
                      border: Border.all(color: kCardinal.shade300),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_rounded,
                          color: kCardinal.shade600,
                        ),
                        SizedBox(width: kSpacingX5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.i10n.tourCreationErrorTitle,
                                style: context.textTheme.headlineMedium,
                              ),
                              SizedBox(height: kSpacingX1),
                              Text(
                                context.i10n.tourCreationErrorDescription,
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
          ),
          Text(
            context.i10n.tourValidationTitle,
            style: context.textTheme.displayMedium,
          ),
          SizedBox(height: kSpacingX7),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: kPaddingMd2),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(kSpacingX3),
              border: Border.all(color: kBorder3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kPaddingSm3),
                          decoration: BoxDecoration(
                            color: kCodGray.shade100,
                            borderRadius: BorderRadius.circular(kPaddingSm3),
                          ),
                          child: Center(
                            child: Text(
                              DateFormat("d\nMMM").format(
                                DateTime.parse(data['dateDebut']),
                              ),
                              textAlign: TextAlign.center,
                              style: context.textTheme.displaySmall!.copyWith(
                                color: kBrightSun.shade600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: kSpacingX4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.i10n.tourValidationPlanBy,
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(height: kSpacingX1),
                              Text(
                                delegate.fullName,
                                style: context.textTheme.displaySmall,
                              ),
                              SizedBox(height: kSpacingX1),
                              Text(
                                DateTime.parse(data['dateDebut']).ddMMYYYY(),
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: kSpacingX3),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                  child: Text(
                    context.i10n.tourValidationClientLabelNumber(clients.length),
                    style: context.textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      final Person client = clients[index];
                      return ClientCard(client: client);
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
