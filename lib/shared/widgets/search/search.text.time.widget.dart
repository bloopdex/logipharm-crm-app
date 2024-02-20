import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/search/search_cubit.dart';
import '../popup/time.interval.picker.dart';
import '../text/custom.text.field.widget.dart';

class SearchTextTimeWidget extends StatelessWidget {
  const SearchTextTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchCubit search = SearchCubit.get(context);

    return Row(
      children: [
        Expanded(
          child: CustomTextField(
              hintText: "visits:search".translate(context),
              initialValue: search.state.searchQuery,
              prefixIcon: Icons.search,
              onChange: (query) {
                search.setSearchQuery(query ?? "");
              }),
        ),
        SizedBox(width: kSpacingX1),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => const TimeIntervalPicker());
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(44.sp, 44.sp),
              backgroundColor: kBgGrayVisibility1,
              padding: EdgeInsets.all(kSpacingX1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kSpacingX1),
              ),
            ),
            child: Icon(
              Icons.calendar_month_rounded,
              color: kBgBlack,
              size: 24.sp,
            ))
      ],
    );
  }
}
