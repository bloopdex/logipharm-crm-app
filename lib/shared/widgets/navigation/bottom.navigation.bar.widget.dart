import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../features/navigation/cubit/navigation_cubit.dart';
import '../../../logic/search/search_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.layout,
  });

  final NavigationCubit layout;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimary,
      unselectedItemColor: kGray.shade800,
      selectedLabelStyle:
          const TextStyle(color: kPrimary, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          TextStyle(color: kGray.shade800, fontWeight: FontWeight.w500),
      selectedFontSize: 10.sp,
      unselectedFontSize: 10.sp,
      showUnselectedLabels: true,
      iconSize: 20.sp,
      currentIndex: layout.current.value.toInt(),
      onTap: (value) {
        layout.change(value);
        context.read<SearchCubit>().setSearchQuery("");
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(LucideIcons.home),
          label: 'layout:home'.translate(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(LucideIcons.pill),
          label: 'layout:medicaments'.translate(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(LucideIcons.fileStack),
          label: 'layout:orders'.translate(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(LucideIcons.shoppingBag),
          label: 'layout:card'.translate(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(LucideIcons.menu),
          label: 'layout:menu'.translate(context),
        ),
      ],
    );
  }
}
