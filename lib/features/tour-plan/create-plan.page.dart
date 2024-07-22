import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';
import '../../logic/counter_cubit.dart';
import '../../logic/selection_cubit.dart';
import '../../shared/widgets/buttons/button.widget.dart';
import '../../shared/widgets/navigation/stepper.widget.dart';
import 'bloc/delegate_cubit.dart';
import 'bloc/tour-creation/tour_creation_cubit.dart';
import 'pages/add-clients.page.dart';
import 'pages/creation-loading.page.dart';
import 'pages/creation-successful.page.dart';
import 'pages/delegate-selection.page.dart';
import 'pages/validate-creation.page.dart';

class CreatePlanPage extends StatefulWidget {
  static const String routeName = '/create-plan';
  const CreatePlanPage({super.key});

  @override
  State<CreatePlanPage> createState() => _CreatePlanPageState();
}

class _CreatePlanPageState extends State<CreatePlanPage> {
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
    context.read<CounterCubit>().reset();
    context.read<TourCreationCubit>().reset();
    final delegate = context.read<DelegateCubit>().state.first.id.toString();
    data['delegueId'] = delegate;
    data['dateDebut'] = DateTime.now().YYYYMMdd();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectionCubit>(lazy: false, create: (context) => SelectionCubit()..clear()),
      ],
      child: BlocBuilder<TourCreationCubit, TourCreationState>(
        builder: (context, state) {
          return state.maybeWhen(
              loading: () {
                return const TourCreationLoadingPage();
              },
              loaded: (tour) => const CreationSuccessfulPage(),
              orElse: () => Scaffold(
                    appBar: AppBar(
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
                                steps: 3,
                                stepHeight: 4.sp,
                              );
                            },
                          ),
                        ],
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    // Stepper using iam_stepper
                    body: Container(
                      constraints: BoxConstraints(
                        maxWidth: context.width,
                        minWidth: context.width,
                        maxHeight: context.height - context.appBarSize - context.paddingBottom,
                        minHeight: context.height - context.appBarSize - context.paddingBottom,
                      ),
                      child: BlocBuilder<CounterCubit, int>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Expanded(
                                child: state == 0
                                    ? DelegateSelectionForm(
                                        data: data,
                                      )
                                    : state == 1
                                        ? AddClientsForm(
                                            data: data,
                                          )
                                        : state == 2
                                            ? ValidateCreationPage(data: data)
                                            : Container(),
                              ),
                              SizedBox(height: kSpacingX4),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: kPaddingMd2, left: kPaddingMd2, bottom: kPaddingMd2),
                                child: CustomButton(
                                  text: state < 2 ? context.i10n.next : context.i10n.validate,
                                  onPressed: () {
                                    switch (state) {
                                      case 0:
                                        if (data['delegueId'] == null) {
                                          return;
                                        }
                                        context.read<CounterCubit>().increment();
                                        break;
                                      case 1:
                                        if (context.read<SelectionCubit>().state.selected.isEmpty) {
                                          return;
                                        }
                                        data['pharmacieIds'] = context
                                            .read<SelectionCubit>()
                                            .state
                                            .selected
                                            .map((e) => e)
                                            .toList();
                                        context.read<CounterCubit>().increment();
                                        break;
                                      case 2:
                                        context.read<TourCreationCubit>().validate(data: data);
                                        break;
                                    }
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
