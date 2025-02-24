import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:crm/features/tour-plan/tour-plan-details.page.dart';
import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../shared/widgets/image/svg.dart';
import '../../../shared/widgets/popup/modalbottomsheet.popup.dart';
import '../../navigation/navigation.screen.dart';
import '../bloc/tour-creation/tour_creation_cubit.dart';

class CreationSuccessfulPage extends StatelessWidget {
  const CreationSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCeruleanBlue.shade900,
      appBar: AppBar(
        backgroundColor: kCeruleanBlue.shade900,
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<TourPlanBloc, TourPlanState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            failure: (message) {
              context.errorSnackBar(message);
            },
            loaded: (tour, _, __, ___) {
              context.pushAndRemoveUntil(const NavigationScreen());
            },
          );
        },
        child: Container(
          padding: EdgeInsets.only(
            left: kPaddingMd2,
            right: kPaddingMd2,
            bottom: context.paddingBottom,
          ),
          constraints: BoxConstraints(
            maxHeight: context.height,
            maxWidth: context.width,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140.h,
                      height: 140.h,
                      padding: EdgeInsets.all(kSpacingX8),
                      decoration: BoxDecoration(
                        color: kCeruleanBlue.shade600,
                        shape: BoxShape.circle,
                        border: Border.all(color: kCeruleanBlue.shade900),
                      ),
                      child: SVG(
                        'tour.svg',
                        icon: true,
                        height: 20.h,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: kSpacingX10),
                    Text(
                      context.i10n.tourCreationSuccessTitle,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      softWrap: true,
                      style: context.textTheme.displayLarge!.copyWith(color: kWhite),
                    ),
                    SizedBox(height: kSpacingX4),
                    Text(
                      context.i10n.tourCreationSuccessDescription,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      softWrap: true,
                      style: context.textTheme.bodyLarge!.copyWith(color: kWhite),
                    ),
                  ],
                ),
              ),
              BlocBuilder<TourCreationCubit, TourCreationState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      ModalBottomSheet(
                        icon: const SVG('tour.svg', icon: true),
                        confirmText: context.i10n.viewDetails,
                        cancelText: context.i10n.later,
                        title: context.i10n.tourCreationStartTour,
                        subtitle: context.i10n.tourCreationStartTourDescription,
                        onConfirm: () {
                          context.pop();
                          state.maybeWhen(
                              orElse: () {},
                              loaded: (tour) {
                                context.pushReplacement(TourPlanDetailPage(tour: tour));
                              });
                        },
                        onCancel: () => context.pushAndRemoveUntil(const NavigationScreen()),
                        child: CustomButton(
                          text: context.i10n.viewDetails,
                          backgroundColor: kBgButtonSecondary,
                          textColor: kText1,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: kPaddingMd2),
            ],
          ),
        ),
      ),
    );
  }
}
