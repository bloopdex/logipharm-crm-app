import 'package:crm/features/tour-plan/core/controller.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TourStatusTabBar extends StatelessWidget {
  const TourStatusTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: TourTabController.controller,
      indicatorColor: kTextPrimary,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: kCeruleanBlue.shade100,
        borderRadius: BorderRadius.circular(kSpacingX12),
      ),
      labelColor: kPrimaryColor,
      labelStyle: context.textTheme.headlineSmall,
      labelPadding: EdgeInsets.symmetric(horizontal: kPaddingSm3),
      unselectedLabelColor: kText1,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      tabs: [
        Tab(
          text: context.i10n.tourAllPlans,
        ),
        Tab(
          text: context.i10n.tourPendingPlans,
        ),
        Tab(
          text: context.i10n.tourInProgressPlans,
        ),
        Tab(
          text: context.i10n.tourCompletedPlans,
        ),
      ],
    );
  }
}
