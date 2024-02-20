import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../features/navigation/cubit/navigation_cubit.dart';
import '../../../logic/search/search_cubit.dart';
import '../popup/time.interval.picker.dart';
import '../text/custom.text.field.widget.dart';

class CustomBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomBottomAppBar({
    super.key,
    required this.current,
    required this.medicamentTabController,
    required this.orderTabController,
  });
  final AppScreen current;
  final TabController medicamentTabController;
  final TabController orderTabController;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 120.sp),
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: kSpacingX2),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                SearchCubit search = SearchCubit.get(context);
                if (current.value == 1) {
                  return CustomTextField(
                    hintText: "medicaments:search".translate(context),
                    prefixIcon: LucideIcons.search,
                    onChange: (query) => search.setSearchQuery(query ?? ""),
                  );
                } else {
                  if (current.value == 2) {
                    return Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                              hintText: "orders:search".translate(context),
                              prefixIcon: LucideIcons.search,
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
                  } else {
                    return const SizedBox.shrink();
                  }
                }
              },
            ),
            SizedBox(height: kSpacingX2),
            if (current.value == 1)
              TabBar(
                isScrollable: true,
                controller: medicamentTabController,
                indicatorColor: kPrimary,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: kPrimary,
                labelStyle: context.textTheme.headlineMedium,
                unselectedLabelColor: textSecondary,
                tabs: const [
                  MedicamentsSourceFilter(
                    icon: LucideIcons.pill,
                    text: "medicaments:stock",
                  ),
                  MedicamentsSourceFilter(
                    icon: LucideIcons.loader,
                    text: "medicaments:arrival",
                  ),
                ],
              ),
            if (current.value == 2)
              TabBar(
                isScrollable: true,
                controller: orderTabController,
                indicatorColor: kPrimary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(kSpacingX12),
                ),
                labelColor: Colors.white,
                labelStyle: context.textTheme.bodySmall,
                unselectedLabelColor: textSecondary,
                tabs: const [
                  OrdersStatusFilter(
                    text: "orders:all",
                  ),
                  OrdersStatusFilter(
                    icon: LucideIcons.loader,
                    text: "orders:pending",
                  ),
                  OrdersStatusFilter(
                    icon: LucideIcons.check,
                    text: "orders:validated",
                  ),
                  OrdersStatusFilter(
                    icon: LucideIcons.loader,
                    text: "orders:preparing",
                  ),
                  OrdersStatusFilter(
                    icon: LucideIcons.checkCheck,
                    text: "orders:shipped",
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.sp);
}

class MedicamentsSourceFilter extends StatelessWidget {
  const MedicamentsSourceFilter({
    super.key,
    this.icon,
    required this.text,
  });

  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kSpacingX1),
      child: Row(children: [
        Icon(icon, size: 24.sp),
        SizedBox(width: kSpacingX2),
        Text(text.translate(context)),
      ]),
    );
  }
}

class OrdersStatusFilter extends StatelessWidget {
  const OrdersStatusFilter({
    super.key,
    this.icon,
    required this.text,
  });
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      child: Row(children: [
        if (icon != null)
          Row(
            children: [
              Icon(icon, size: 16.sp),
              SizedBox(width: kSpacingX1),
            ],
          ),
        Text(
          text.translate(context),
        ),
      ]),
    );
  }
}
