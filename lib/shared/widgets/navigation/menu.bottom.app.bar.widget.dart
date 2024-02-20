import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../logic/search/search_cubit.dart';
import '../popup/time.interval.picker.dart';
import '../text/custom.text.field.widget.dart';

class CustomMenuBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomMenuBottomAppBar({
    super.key,
    this.time = true,
  });

  final bool time;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 120.sp),
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: kSpacingX2),
        margin: EdgeInsets.only(bottom: kSpacingX1),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                SearchCubit search = SearchCubit.get(context);
                return Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "general:search".translate(context),
                        prefixIcon: LucideIcons.search,
                        onChange: (query) => search.setSearchQuery(query ?? ""),
                      ),
                    ),
                    SizedBox(width: kSpacingX1),
                    if (time)
                      ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                builder: (context) =>
                                    const TimeIntervalPicker());
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
                          ))
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44.sp);
}
