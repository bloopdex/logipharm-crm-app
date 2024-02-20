import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../logic/localizations/localizations_bloc.dart';
import '../popup/time.interval.picker.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 50.sp,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (canPop)
              IconButton(
                onPressed: () => context.pop(),
                icon: BlocBuilder<LocalizationsBloc, LocalizationsState>(
                  builder: (context, state) {
                    return state.locale.languageCode != 'ar'
                        ? const Icon(LucideIcons.chevronLeft)
                        : const Icon(LucideIcons.chevronRight);
                  },
                ),
              ),
            Center(
              child: Text(
                title.translate(context),
                style: context.textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isDismissible: false,
                        context: context,
                        builder: (context) => const TimeIntervalPicker());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(44.sp, 44.sp),
                    backgroundColor: kPrimary.shade500,
                    padding: EdgeInsets.all(kSpacingX1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kSpacingX1),
                      side: BorderSide(
                        color: kPrimary.shade600,
                        width: 1.sp,
                      ),
                    ),
                  ),
                  child: Icon(
                    LucideIcons.calendar,
                    color: Colors.white,
                    size: 24.sp,
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.sp);
}
