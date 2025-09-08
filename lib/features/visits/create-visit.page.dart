// CreateVisitPage.dart
import 'dart:convert';

import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:crm/features/tour-plan/models/tour.dart';
import 'package:crm/features/visits/pages/creation-successful.page.dart';
import 'package:crm/logic/auth/auth_bloc.dart';
import 'package:crm/models/user/user.dart';
import 'package:crm/shared/services/helpers/location.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/core.dart';
import '../../logic/counter_cubit.dart';
import '../../shared/widgets/buttons/button.widget.dart';
import '../../shared/widgets/navigation/stepper.widget.dart';
import 'bloc/visit-creation/visit_creation_cubit.dart';
import 'pages/client-selection.page.dart';
import 'pages/creation-loading.page.dart';
import 'pages/validate-creation.page.dart';

class CreateVisitPage extends StatefulWidget {
  static const String routeName = '/create-plan';
  final Tour tour;
  final String? pharmacieId;

  const CreateVisitPage({super.key, required this.tour, this.pharmacieId});

  @override
  State<CreateVisitPage> createState() => _CreateVisitPageState();
}

class _CreateVisitPageState extends State<CreateVisitPage> {
  late User user;

  final QuillController _quillController = QuillController.basic();
  final ScrollController _scrollController = ScrollController();

  Map<String, dynamic> data = {};

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 1000,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();

    user = context.read<AuthBloc>().user;

    context.read<CounterCubit>().reset();
    context.read<VisitCreationCubit>().reset();
    data['dateDebut'] = DateTime.now();

    if (widget.pharmacieId != null) {
      data['pharmacieId'] = widget.pharmacieId?.toString();
    }
    data['tourneeId'] = widget.tour.tourId;
  }

  void _onQuillChange() {
    setState(() {
      debugPrint(
          'Quill text changed: ${_quillController.document.toPlainText()} length: ${_quillController.document.toPlainText().trim().length} Valid: ${_quillController.document.toPlainText().trim().length >= (user.minReportChar ?? 1)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisitCreationCubit, VisitCreationState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            loaded: (visit) {
              context.read<TourPlanBloc>().add(const TourPlanEvent.started());
            });
      },
      builder: (context, state) {
        final bottomSize = context.width < 400.h ? 120.h : 80.h;
        return state.maybeWhen(
            loading: () {
              return const VisitCreationLoadingPage();
            },
            loaded: (tour) => const VisitCreationSuccessfulPage(),
            orElse: () => Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.i10n.createNewVisit,
                          style: context.textTheme.headlineSmall,
                        ),
                        SizedBox(height: kSpacingX1),
                        BlocBuilder<CounterCubit, int>(
                          builder: (context, state) {
                            return CustomStepper(
                              activeStep: state,
                              steps: 2,
                              stepHeight: 4.h,
                            );
                          },
                        ),
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: context.read<CounterCubit>().state < 1
                          ? Size.fromHeight(bottomSize)
                          : const Size.fromHeight(0),
                      child: context.read<CounterCubit>().state < 1
                          ? QuillSimpleToolbar(
                              controller: _quillController,
                              config: QuillSimpleToolbarConfig(
                                showAlignmentButtons: true,
                                showBackgroundColorButton: false,
                                showColorButton: false,
                                showCodeBlock: false,
                                showQuote: false,
                                showLink: false,
                                showClearFormat: false,
                                showInlineCode: false,
                                showListCheck: false,
                                showJustifyAlignment: false,
                                showHeaderStyle: false,
                                showSearchButton: false,
                                showFontFamily: false,
                              ))
                          : const SizedBox.shrink(),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  body: Container(
                    constraints: BoxConstraints(
                      maxWidth: context.width,
                      minWidth: context.width,
                      maxHeight: context.read<CounterCubit>().state == 0
                          ? context.height - context.appBarSize - context.paddingBottom - bottomSize
                          : context.height - context.appBarSize - context.paddingBottom,
                      minHeight: context.read<CounterCubit>().state == 0
                          ? context.height - context.appBarSize - context.paddingBottom - bottomSize
                          : context.height - context.appBarSize - context.paddingBottom,
                    ),
                    child: BlocBuilder<CounterCubit, int>(
                      builder: (context, state) {
                        return ListView(
                          controller: _scrollController,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: context.height - context.height / 3,
                                minHeight: context.height - context.height / 3,
                              ),
                              child: state == 0
                                  ? ClientSelectionForm(
                                      quillController: _quillController,
                                      onQuillFocus: _scrollToBottom,
                                      tour: widget.tour,
                                      clients: widget.tour.pharmacies!
                                          .where((element) => element.statusFlag == 0)
                                          .toList(),
                                      data: data,
                                      onQuillChange: _onQuillChange,
                                    )
                                  : VisitValidateCreationPage(tour: widget.tour, data: data),
                            ),
                            SizedBox(height: kSpacingX4),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: kPaddingMd2, right: kPaddingMd2, bottom: kPaddingLg1),
                              child: Row(
                                children: [
                                  if (state == 0)
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: kSpacingX1),
                                        child: CustomButton(
                                          text: context.i10n.cancel,
                                          backgroundColor: kCardinal,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ),
                                  if (state == 1)
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: kSpacingX1),
                                        child: CustomButton(
                                          text: context.i10n.back,
                                          backgroundColor: kCardinal,
                                          onPressed: () {
                                            context.read<CounterCubit>().decrement();
                                          },
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: CustomButton(
                                      text: state < 1 ? context.i10n.next : context.i10n.validate,
                                      disabled: state == 0
                                          ? data['pharmacieId'] == null ||
                                              data['motif'] == null ||
                                              _quillController.document
                                                      .toPlainText()
                                                      .trim()
                                                      .length <
                                                  (user.minReportChar ?? 1)
                                          : false,
                                      onPressed: () async {
                                        switch (state) {
                                          case 0:
                                            final text =
                                                _quillController.document.toPlainText().trim();
                                            if (data['pharmacieId'] == null ||
                                                data['motif'] == null ||
                                                text.isEmpty ||
                                                text.length < (user.minReportChar ?? 1)) {
                                              return;
                                            }
                                            data['document'] = _quillController.document;
                                            context.read<CounterCubit>().increment();
                                            if (!context.mounted) return;
                                            setState(() {});
                                            break;
                                          case 1:
                                            data['rapportText'] =
                                                _quillController.document.toPlainText().trim();
                                            data['rapport'] = json.encode(
                                                _quillController.document.toDelta().toJson());

                                            Position? position;

                                            // First attempt to get location
                                            try {
                                              position = await LocationHelper.getCurrentPosition();
                                            } on Exception {
                                              // Initial location retrieval failed
                                            }

                                            if (position == null) {
                                              // Check current permission status
                                              final permission = await Geolocator.checkPermission();

                                              if (permission == LocationPermission.denied) {
                                                // Request permission again
                                                final newPermission =
                                                    await Geolocator.requestPermission();

                                                if (newPermission ==
                                                        LocationPermission.whileInUse ||
                                                    newPermission == LocationPermission.always) {
                                                  // Get position again after permission granted
                                                  try {
                                                    final newPosition =
                                                        await LocationHelper.getCurrentPosition();
                                                    if (newPosition != null) {
                                                      data['latitude'] = newPosition.latitude;
                                                      data['longitude'] = newPosition.longitude;
                                                    }
                                                  } on Exception {
                                                    // Handle exception if user denies again
                                                  }
                                                } else {
                                                  // User denied permission again
                                                  if (context.mounted) {
                                                    context.errorSnackBar(
                                                        context.i10n.locationPermissionRequired);
                                                  }
                                                }
                                              } else if (permission ==
                                                  LocationPermission.deniedForever) {
                                                // Handle permanent denial
                                                if (context.mounted) {
                                                  context.errorSnackBar(
                                                      context.i10n.locationPermissionRequired);
                                                }
                                              }
                                            } else {
                                              // Position successfully obtained
                                              data['latitude'] = position.latitude;
                                              data['longitude'] = position.longitude;
                                            }

                                            if (data['latitude'] == null ||
                                                data['longitude'] == null) {
                                              if (context.mounted) {
                                                context.errorSnackBar(
                                                    context.i10n.locationPermissionRequired);
                                              }
                                              return;
                                            }

                                            data["dateFin"] = DateTime.now();

                                            if (context.mounted) {
                                              context
                                                  .read<VisitCreationCubit>()
                                                  .validate(data: data);
                                            }
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ));
      },
    );
  }
}
