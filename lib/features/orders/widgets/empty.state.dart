import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/image/svg.dart';
import '../../navigation/cubit/navigation_cubit.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: kSpacingX2),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SVG(
                'cart.svg',
                icon: true,
                width: 60.h,
              ),
              SizedBox(height: kSpacingX2),
              Text(
                context.i10n.emptyCart,
                style: context.textTheme.titleLarge,
              ),
              SizedBox(height: kSpacingX1),
              Text(
                context.i10n.emptyCartDescription,
                maxLines: 5,
                textAlign: TextAlign.center,
                style: context.textTheme.titleSmall,
              ),
              SizedBox(height: kSpacingX2),
              ElevatedButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: 24.h,
                      vertical: 12.h,
                    ),
                  ),
                  elevation: WidgetStateProperty.all(0),
                  backgroundColor: WidgetStateProperty.all(kBgGrayVisibility1),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kSpacingX1),
                      side: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                ),
                onPressed: () {
                  context.read<NavigationCubit>().change(1);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                    SizedBox(width: kSpacingX2),
                    Text(
                      context.i10n.addProducts,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
