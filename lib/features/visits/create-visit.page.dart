import 'package:crm/features/tour-plan/models/tour.dart';
import 'package:crm/features/visits/pages/creation-successful.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';
import '../../logic/counter_cubit.dart';
import '../../shared/widgets/buttons/button.widget.dart';
import '../../shared/widgets/navigation/stepper.widget.dart';
import 'bloc/tour-creation/visit_creation_cubit.dart';
import 'pages/client-selection.page.dart';
import 'pages/creation-loading.page.dart';
import 'pages/validate-creation.page.dart';

class CreateVisitPage extends StatefulWidget {
  static const String routeName = '/create-plan';
  final Tour tour;
  const CreateVisitPage({super.key, required this.tour});

  @override
  State<CreateVisitPage> createState() => _CreateVisitPageState();
}

class _CreateVisitPageState extends State<CreateVisitPage> {
  final QuillController _quillController = QuillController.basic();

  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
    context.read<CounterCubit>().reset();
    context.read<VisitCreationCubit>().reset();
    data['dateDebut'] = DateTime.now().YYYYMMdd();
    data['pharmacieId'] = widget.tour.pharmacies?.first.pharmacy!.id.toString();
    data['tourneeId'] = widget.tour.tourneeId;
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
                          context.i10n.tourCreateNewPlan,
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
                          ? Size.fromHeight(150.sp)
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
                              150.sp
                          : context.height -
                              context.appBarSize -
                              context.paddingBottom,
                      minHeight: context.read<CounterCubit>().state == 0
                          ? context.height -
                              context.appBarSize -
                              context.paddingBottom -
                              150.sp
                          : context.height -
                              context.appBarSize -
                              context.paddingBottom,
                    ),
                    child: SingleChildScrollView(
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
                                          clients: widget.tour.pharmacies ?? [],
                                          data: data,
                                        )
                                      : VisitValidateCreationPage(
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
                                    onPressed: () {
                                      switch (state) {
                                        case 0:
                                          if (data['dateDebut'] == null ||
                                              data['pharmacieId'] == null ||
                                              data['motif'] == null ||
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
                                          setState(() {});
                                          break;
                                        case 1:
                                          data['rapport'] = _quillController
                                              .document
                                              .toPlainText();
                                          context
                                              .read<VisitCreationCubit>()
                                              .validate(data: data);
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
