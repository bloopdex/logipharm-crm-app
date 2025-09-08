import 'package:crm/core/extension.dart';
import 'package:crm/features/orders/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const.dart';
import '../../../shared/utils/money.formatter.dart';
import '../product_details_screen.dart';

class MedicamentCard extends StatelessWidget {
  const MedicamentCard({
    super.key,
    required this.medicament,
    this.replacement = false,
  });

  final Product medicament;
  final bool replacement;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RefactorDetails(medicament: medicament));
      },
      child: Row(
        children: [
          Container(
            width: 65.h,
            height: 65.h,
            padding: EdgeInsets.all(kPaddingMd1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
              color: kCeruleanBlue.shade100.withAlpha(100),
            ),
            child: SvgPicture.asset(
              '${icons}medicament.svg',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(width: kSpacingX1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicament.commercialName,
                  style: context.textTheme.headlineMedium!.copyWith(
                    color: kPrimaryColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: kSpacingHalf),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${context.i10n.expirationDate} : ${medicament.datePeremption.month}/${medicament.datePeremption.year}',
                            style: context.textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${context.i10n.lot} : ${medicament.nlot}',
                            style: context.textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: kSpacingX1),
                    Text(
                      textDirection: TextDirection.ltr,
                      MoneyHelper.format(context, medicament.prixPpa.toDouble()),
                      style: context.textTheme.displaySmall!.copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
