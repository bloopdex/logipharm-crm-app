import 'dart:convert';
import 'dart:developer';

import 'package:crm/features/tour-plan/models/tour.dart';
import 'package:crm/features/visits/bloc/visits/visit_bloc.dart';
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
import 'pages/validate-update.page.dart';

class UpdateVisitPage extends StatefulWidget {
  static const String routeName = '/create-plan';
  final TourDetail tour;

  const UpdateVisitPage({super.key, required this.tour});

  @override
  State<UpdateVisitPage> createState() => _UpdateVisitPageState();
}

class _UpdateVisitPageState extends State<UpdateVisitPage> {
  QuillController _quillController = QuillController.basic();
  final ScrollController _scrollController = ScrollController();

  Map<String, dynamic> data = {};

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<CounterCubit>().reset();
    context.read<VisitCreationCubit>().reset();
    debugPrint('tour: ${widget.tour}');
    data['dateDebut'] = DateTime.now().YYYYMMdd();
    data['pharmacieId'] =
        '${widget.tour.pharmacy!.id}:${widget.tour.pharmacy!.typeTier}';
    data['tourneeId'] = widget.tour.masterTourId;
    data['motif'] = widget.tour.reason?.id.toString();
    if (widget.tour.reason != null && widget.tour.reason?.id != -1) {
      data['motif'] = widget.tour.reason;
    }
    // Initialize contactType if not set
    data['contactType'] = data['contactType'] ?? '';
    if (widget.tour.report != null) {
      try {
        List<dynamic> deltaOperations = json.decode(widget.tour.report!);
        Document document = Document.fromJson(deltaOperations);

        _quillController = QuillController(
          document: document,
          selection: const TextSelection.collapsed(offset: 0),
        );
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitCreationCubit, VisitCreationState>(
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
                          context.i10n.updateVisit,
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
                          ? Size.fromHeight(160.h)
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
                          ? context.height -
                              context.appBarSize -
                              context.paddingBottom -
                              160.h
                          : context.height -
                              context.appBarSize -
                              context.paddingBottom,
                      minHeight: context.read<CounterCubit>().state == 0
                          ? context.height -
                              context.appBarSize -
                              context.paddingBottom -
                              160.h
                          : context.height -
                              context.appBarSize -
                              context.paddingBottom,
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
                                      200.h
                                  : context.height -
                                      context.appBarSize -
                                      context.paddingBottom -
                                      70.h,
                              minHeight: context.read<CounterCubit>().state == 0
                                  ? context.height -
                                      context.appBarSize -
                                      context.paddingBottom -
                                      200.h
                                  : context.height -
                                      context.appBarSize -
                                      context.paddingBottom -
                                      70.h,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: state == 0
                                      ? ClientSelectionForm(
                                          quillController: _quillController,
                                          onQuillFocus: _scrollToBottom,
                                          clients: [widget.tour],
                                          data: data,
                                        )
                                      : VisitValidateUpdatePage(
                                          tour: widget.tour, data: data),
                                ),
                                SizedBox(height: kSpacingX4),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kPaddingMd2),
                                  child: CustomButton(
                                    text: state < 1
                                        ? context.i10n.next
                                        : context.i10n.validate,
                                    onPressed: () async {
                                      switch (state) {
                                        case 0:
                                          if (data['dateDebut'] == null ||
                                              data['pharmacieId'] == null ||
                                              data['motif'] == null ||
                                              (data['contactType'] == null ||
                                                  (data['contactType']
                                                          as String)
                                                      .isEmpty) ||
                                              _quillController.document
                                                  .toPlainText()
                                                  .isEmpty) {
                                            return;
                                          }
                                          data['document'] =
                                              _quillController.document;
                                          context
                                              .read<CounterCubit>()
                                              .increment();
                                          // check if mounted
                                          if (!mounted) return;
                                          setState(() {});
                                          break;
                                        case 1:
                                          data['rapportText'] = _quillController
                                              .document
                                              .toPlainText();
                                          data['rapport'] = _quillController
                                              .document
                                              .toDelta()
                                              .toJson()
                                              .toString();
                                          final position = await LocationHelper
                                              .getCurrentPosition();
                                          if (position != null) {
                                            data['latitude'] =
                                                position.latitude;
                                            data['longitude'] =
                                                position.longitude;
                                          }
                                          if (!context.mounted) return;
                                          // ensure label
                                          if (data['contactType'] is! String) {
                                            data['contactType'] =
                                                data['contactType']
                                                        ?.toString() ??
                                                    '';
                                          }
                                          context
                                              .read<VisitCreationCubit>()
                                              .validate(data: data);
                                          context
                                              .read<VisitBloc>()
                                              .add(const VisitEvent.started());
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
