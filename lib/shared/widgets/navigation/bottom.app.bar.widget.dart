import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../features/navigation/cubit/navigation_cubit.dart';
import '../search/search.text.time.widget.dart';

class CustomBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomBottomAppBar({
    super.key,
    required this.current,
  });
  final AppScreen current;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 120.sp),
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: kSpacingX5),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            current.value == 2
                ? const SearchTextTimeWidget()
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44.sp);
}
