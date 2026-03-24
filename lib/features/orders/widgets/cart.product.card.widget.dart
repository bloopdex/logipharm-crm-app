import 'package:crm/core/core.dart';
import 'package:crm/features/orders/blocs/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/utils/money.formatter.dart';
import '../../../shared/widgets/popup/confirmation.popup.dart';
import '../models/cart/cart_item.dart';
import 'dismissable.card.widget.dart';

class CartProductCard extends StatefulWidget {
  const CartProductCard({
    super.key,
    required this.cart,
    required this.index,
  });

  final int index;
  final CartItem cart;

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  late final controller = TextEditingController();
  final FocusNode focus = FocusNode();

  @override
  void initState() {
    controller.text = "${widget.cart.qte ?? 0}";
    focus.addListener(() {
      if (focus.hasFocus) controller.clear();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.cart.no ?? 0),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          context.read<CartCubit>().deleteItemFromCart({
            "cpsNo": widget.cart.no ?? 0,
          });
        }
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ConfirmationPopUp(
                icon: Icons.close,
                title: context.i10n.cartConfirmDelete,
                confirmText: context.i10n.cartRemoveItem,
                cancelText: context.i10n.cartCancelDelete,
                color: kCardinal,
                iconBackground: kCardinal.shade100,
              );
            },
          );
        }
        return false;
      },
      background: const DismissibleDeleteCard(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingX2,
          vertical: kSpacingX2,
        ),
        decoration: BoxDecoration(
          color: kWhite,
          border: Border.symmetric(
            vertical: BorderSide(
              color: kBorder3,
            ),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // const Column(children: [Expanded(child: DefaultMedicamentProduct())]),
              // SizedBox(width: kSpacingX1),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cart.commercialName ?? '-',
                      maxLines: 2,
                      style: context.textTheme.headlineMedium,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                      width: double.infinity,
                      height: 1,
                      color: kBorder3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${context.i10n.quantity} : ${(widget.cart.qteSansUg ?? 0).toInt()}',
                              style: context.textTheme.titleMedium!.copyWith(
                                fontSize: 18.h,
                              ),
                            ),
                            Text(
                              '${context.i10n.unitPrice} : ${MoneyHelper.format(context, widget.cart.prixPh ?? 0)}',
                              style: context.textTheme.titleMedium!.copyWith(
                                fontSize: 18.h,
                              ),
                            ),
                            Text(
                              '${context.i10n.ppa} : ${MoneyHelper.format(context, widget.cart.prixPpa ?? 0)}',
                              style: context.textTheme.titleMedium!.copyWith(
                                fontSize: 18.h,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            MoneyHelper.format(context,
                                widget.cart.montant?.toDouble() ?? 0.0),
                            style: context.textTheme.headlineLarge,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
