import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../core/core.dart';
import '../../../shared/services/helpers/location.helper.dart';
import '../../tour-plan/models/tour.dart';
import '../bloc/visit-creation/visit_creation_cubit.dart';

class VisitValidateUpdatePage extends StatelessWidget {
  final TourDetail tour;
  final Map<String, dynamic> data;
  const VisitValidateUpdatePage({super.key, required this.data, required this.tour});

  @override
  Widget build(BuildContext context) {
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
                                softWrap: true,
                                maxLines: 3,
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
                            child: Text(tour.pharmacy?.fullName.initials ?? "",
                                textAlign: TextAlign.center, style: context.textTheme.bodyMedium),
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
                                tour.pharmacy?.fullName ?? "",
                                style: context.textTheme.displaySmall,
                              ),
                              SizedBox(height: kSpacingX1),
                              tour.pharmacy?.latitude != null && tour.pharmacy?.longitude != null
                                  ? FutureBuilder(
                                      future: LocationHelper.addressFromLongitudeLatitude(
                                        latitude: tour.pharmacy?.latitude ?? 0,
                                        longitude: tour.pharmacy?.longitude ?? 0,
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
                          readOnly: true,
                        ),
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
