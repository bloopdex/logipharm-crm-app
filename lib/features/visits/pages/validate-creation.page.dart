import 'package:crm/features/tour-plan/bloc/clients/clients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../core/core.dart';
import '../../../models/person/person.dart';
import '../../../shared/services/helpers/location.helper.dart';
import '../../tour-plan/models/tour.dart';
import '../bloc/visit-creation/visit_creation_cubit.dart';

class VisitValidateCreationPage extends StatelessWidget {
  final Tour tour;
  final Map<String, dynamic> data;

  const VisitValidateCreationPage({super.key, required this.data, required this.tour});

  @override
  Widget build(BuildContext context) {
    List<TourDetail> clients = tour.pharmacies
            ?.where(
              (element) => element.pharmacy?.id.toString() == data['pharmacieId'],
            )
            .toList() ??
        [];
    TourDetail? client = clients.isNotEmpty ? clients.first : null;
    Person? pharmacy;
    if (client == null) {
      pharmacy = context.read<ClientsCubit>().state.maybeWhen(
          orElse: () => null,
          loaded: (clients) {
            return clients.firstWhere(
              (element) => element.id.toString() == data['pharmacieId'],
            );
          });
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<VisitCreationCubit, VisitCreationState>(
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
                                message,
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
            context.i10n.visitValidationTitle,
            style: context.textTheme.displayMedium,
          ),
          SizedBox(height: kSpacingX7),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: kPaddingMd2),
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
                            shape: BoxShape.circle,
                            border: Border.all(color: kCodGray.shade300),
                          ),
                          child: Center(
                            child: Text(
                                client?.pharmacy?.fullName.initials ??
                                    pharmacy?.fullName.initials ??
                                    "",
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodyMedium),
                          ),
                        ),
                        SizedBox(width: kSpacingX4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.i10n.visitValidationClient,
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(height: kSpacingX1),
                              Text(
                                client?.pharmacy?.fullName ?? pharmacy?.fullName ?? "",
                                style: context.textTheme.displaySmall,
                              ),
                              SizedBox(height: kSpacingX1),
                              (client?.pharmacy?.latitude != null &&
                                          client?.pharmacy?.longitude != null) ||
                                      (pharmacy?.latitude != null && pharmacy?.longitude != null)
                                  ? FutureBuilder(
                                      future: LocationHelper.addressFromLongitudeLatitude(
                                        latitude:
                                            client?.pharmacy?.latitude ?? pharmacy?.latitude ?? 0,
                                        longitude:
                                            client?.pharmacy?.longitude ?? pharmacy?.longitude ?? 0,
                                      ),
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.data ?? "",
                                          style: context.textTheme.bodyMedium,
                                        );
                                      })
                                  : Text(
                                      context.i10n.tourCreationNoAddress,
                                      style: context.textTheme.bodyMedium,
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(width: kSpacingX2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.phone_rounded, color: kPrimaryColor),
                            SizedBox(height: kSpacingX1),
                            Icon(Icons.email_rounded, color: kPrimaryColor),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: kSpacingX3),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                  child: Text(
                    context.i10n.visitValidationRapport,
                    style: context.textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: kPaddingSm3),
                    decoration: BoxDecoration(
                      border: Border.all(color: kBorder3),
                      borderRadius: BorderRadius.circular(kSpacingX3),
                    ),
                    child: QuillEditor.basic(
                      configurations: QuillEditorConfigurations(
                        showCursor: false,
                        controller: QuillController(
                            document: data['document'],
                            selection: const TextSelection.collapsed(offset: 0),
                            readOnly: true),
                      ),
                    ),
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
