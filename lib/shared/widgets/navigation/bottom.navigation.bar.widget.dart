import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../features/navigation/cubit/navigation_cubit.dart';
import '../../../logic/search/search_cubit.dart';
import '../../../logic/time.range/time_range_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.layout,
  });

  final NavigationCubit layout;

  @override
  Widget build(BuildContext context) {
    final isDelegateRestricted = (context.user.delegueType == 1);
    if (isDelegateRestricted) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kCeruleanBlue,
        unselectedItemColor: kCodGray.shade800,
        selectedLabelStyle:
            const TextStyle(color: kCeruleanBlue, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            TextStyle(color: kCodGray.shade800, fontWeight: FontWeight.w500),
        selectedFontSize: 10.h,
        unselectedFontSize: 10.h,
        showUnselectedLabels: true,
        iconSize: 20.h,
        // Force single item index to 0
        currentIndex: 0,
        onTap: (value) {
          layout.menu();
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard_outlined),
            activeIcon: const Icon(Icons.dashboard),
            label: context.i10n.navMenu,
          ),
        ],
      );
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kCeruleanBlue,
      unselectedItemColor: kCodGray.shade800,
      selectedLabelStyle:
          const TextStyle(color: kCeruleanBlue, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          TextStyle(color: kCodGray.shade800, fontWeight: FontWeight.w500),
      selectedFontSize: 10.h,
      unselectedFontSize: 10.h,
      showUnselectedLabels: true,
      iconSize: 20.h,
      currentIndex: layout.current.value.toInt(),
      onTap: (value) {
        // Reset date and search filters when changing pages
        try {
          TimeRangeCubit.get(context).reset();
        } catch (_) {}
        try {
          SearchCubit.get(context).reset();
        } catch (_) {}
        layout.change(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home_filled),
          label: context.i10n.navHome,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.offline_bolt_outlined),
          activeIcon: const Icon(Icons.offline_bolt),
          label: context.i10n.navPlans,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.fact_check_outlined),
          activeIcon: const Icon(Icons.fact_check),
          label: context.i10n.navVisits,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.view_timeline_outlined),
          activeIcon: const Icon(Icons.view_timeline),
          label: context.i10n.navTodos,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.dashboard_outlined),
          activeIcon: const Icon(Icons.dashboard),
          label: context.i10n.navMenu,
        ),
      ],
    );
  }
}
