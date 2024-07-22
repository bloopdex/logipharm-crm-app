import 'dart:convert';
import 'dart:developer';

import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:crm/features/tour-plan/models/tour.dart';
import 'package:crm/features/visits/pages/creation-successful.page.dart';
import 'package:crm/shared/services/helpers/location.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    context.read<CounterCubit>().reset();
    context.read<VisitCreationCubit>().reset();
    data['dateDebut'] = DateTime.now().YYYYMMdd();
    data['pharmacieId'] = widget.pharmacieId?.toString();
    data['tourneeId'] = widget.tour.tourId;
    log('tourneeId: ${widget.tour.tourId}');
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
                              stepHeight: 4.sp,
                            );
                          },
                        ),
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: context.read<CounterCubit>().state < 1
                          ? Size.fromHeight(160.sp)
                          : const Size.fromHeight(0),
                      child: context.read<CounterCubit>().state < 1
                          ? QuillToolbar.simple(
                              configurations: QuillSimpleToolbarConfigurations(
                              controller: _quillController,
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
                          ? context.height - context.appBarSize - context.paddingBottom - 160.sp
                          : context.height - context.appBarSize - context.paddingBottom,
                      minHeight: context.read<CounterCubit>().state == 0
                          ? context.height - context.appBarSize - context.paddingBottom - 160.sp
                          : context.height - context.appBarSize - context.paddingBottom,
                    ),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: BlocBuilder<CounterCubit, int>(
                        builder: (context, state) {
                          return Container(
                            constraints: BoxConstraints(
                              maxWidth: context.width,
                              minWidth: context.width,
                              maxHeight: context.read<CounterCubit>().state == 0
                                  ? context.height -
                                      context.appBarSize -
                                      context.paddingBottom -
                                      200.sp
                                  : context.height -
                                      context.appBarSize -
                                      context.paddingBottom -
                                      70.sp,
                              minHeight: context.read<CounterCubit>().state == 0
                                  ? context.height -
                                      context.appBarSize -
                                      context.paddingBottom -
                                      200.sp
                                  : context.height -
                                      context.appBarSize -
                                      context.paddingBottom -
                                      70.sp,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: state == 0
                                      ? ClientSelectionForm(
                                          quillController: _quillController,
                                          onQuillFocus: _scrollToBottom,
                                          clients: widget.tour.pharmacies!
                                              .where((element) => element.statusFlag == 0)
                                              .toList(),
                                          data: data,
                                        )
                                      : VisitValidateCreationPage(tour: widget.tour, data: data),
                                ),
                                SizedBox(height: kSpacingX4),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: kPaddingMd2, right: kPaddingMd2, bottom: kPaddingLg1),
                                  child: CustomButton(
                                    text: state < 1 ? context.i10n.next : context.i10n.validate,
                                    onPressed: () async {
                                      switch (state) {
                                        case 0:
                                          if (data['dateDebut'] == null ||
                                              data['pharmacieId'] == null ||
                                              data['motif'] == null ||
                                              _quillController.document.toPlainText().isEmpty) {
                                            return;
                                          }
                                          data['document'] = _quillController.document;
                                          context.read<CounterCubit>().increment();
                                          if (!context.mounted) return;
                                          setState(() {});
                                          break;
                                        case 1:
                                          data['rapportText'] =
                                              _quillController.document.toPlainText();
                                          data['rapport'] = json
                                              .encode(_quillController.document.toDelta().toJson());
                                          final position =
                                              await LocationHelper.getCurrentPosition();
                                          if (position != null) {
                                            data['latitude'] = position.latitude;
                                            data['longitude'] = position.longitude;
                                          }
                                          context.read<VisitCreationCubit>().validate(data: data);
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ));
      },
    );
  }
}
