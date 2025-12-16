import 'package:crm/features/orders/widgets/empty.state.dart';
import 'package:crm/features/tour-plan/bloc/clients/clients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const.dart';
import '../../core/extension.dart';
import '../../shared/widgets/image/custom_local_image.widget.dart';
import '../../shared/widgets/loading/loader.widget.dart';
import 'blocs/cart/cart_cubit.dart';
import 'widgets/cart.product.card.widget.dart';
import 'widgets/validate.order.card.widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ScrollController controller = ScrollController();
  final focus = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().loadCart();
    controller.addListener(loadMore);

    // Load initial clients data
    final shouldLoadClients = context.read<ClientsCubit>().state.maybeWhen(
          orElse: () => true,
          loaded: (all, filter) => all.isEmpty,
        );

    if (shouldLoadClients) {
      // Check if user is restricted delegate
      bool isDelegateRestricted = false;
      try {
        isDelegateRestricted = context.user.delegueType == 1;
      } catch (_) {}

      context.read<ClientsCubit>().load(usePagination: isDelegateRestricted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.cart),
        centerTitle: true,
        actions: [],
      ),
      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (cart, totalAmount, totalElements, tempErr) {
              if (tempErr != null) {
                context.errorSnackBar(tempErr);
              }
            },
            orElse: () {},
          );
        },
        child: Container(
          color: kWhite,
          height: context.height,
          width: context.width,
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                displacement: kSpacingX6,
                color: kPrimaryColor,
                onRefresh: () async => context.read<CartCubit>().loadCart(),
                child: state.maybeWhen(
                  loaded: (cart, totalAmount, totalElements, tempErr) {
                    if (cart.isEmpty) {
                      return const CartEmptyState();
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: kSpacingX2),
                            child: Text(
                              "$totalElements ${context.i10n.products}",
                              style: context.textTheme.titleMedium!
                                  .copyWith(color: kCodGray.shade700),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: controller,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => CartProductCard(
                                index: index,
                                cart: cart[index],
                                key: Key('cart-item-$index'),
                              ),
                              separatorBuilder: (context, index) =>
                                  Divider(height: kSpacingX1),
                              itemCount: cart.length,
                            ),
                          ),
                          SizedBox(height: kSpacingX1),
                          ValidateOrderCard(total: totalAmount)
                        ],
                      );
                    }
                  },
                  failure: (message) {
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
                            CustomLocalImage(
                              image: 'errors/404.png',
                              width: 200.h,
                            ),
                          ],
                        ),
                      ],
                    ));
                  },
                  orElse: () => Center(
                    child: Loader(size: 24.h, color: kPrimaryColor),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void loadMore() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {}
  }
}
