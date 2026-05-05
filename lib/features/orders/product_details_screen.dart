// ignore_for_file: use_build_context_synchronously

import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../logic/localizations/localizations_bloc.dart';
import '../../shared/services/helpers/money_helper.dart';
import '../../shared/widgets/buttons/button.widget.dart';
import 'blocs/cart/cart_cubit.dart';
import 'models/product/product.dart';

class QuantityCubit extends Cubit<int> {
  QuantityCubit() : super(1);

  static QuantityCubit get(context) => BlocProvider.of(context);

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }

  void reset() => emit(1);

  void setQuantity(int quantity) => emit(quantity);
}

class RefactorDetails extends StatefulWidget {
  static String routeName = '/medicament/details';

  const RefactorDetails({super.key, required this.medicament});

  final Product medicament;

  @override
  State<RefactorDetails> createState() => _RefactorDetailsState();
}

class _RefactorDetailsState extends State<RefactorDetails> {
  final textEditingController = TextEditingController(text: "1");
  final focus = FocusNode();

  @override
  void initState() {
    focus.addListener(() {
      if (focus.hasFocus) textEditingController.clear();
    });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int? venteFlag = context.user.terVentePrixAchat;
    double unitPrice;
    if (venteFlag == 1) {
      unitPrice = (widget.medicament.prixRv ?? widget.medicament.prixPh ?? 0)
          .toDouble();
    } else if (venteFlag == 2) {
      unitPrice = (widget.medicament.prixGr != null)
          ? widget.medicament.prixGr!.toDouble()
          : (widget.medicament.prixPh ?? 0).toDouble();
    } else {
      unitPrice = (widget.medicament.prixPh ?? 0).toDouble();
    }
    return GestureDetector(
      onTap: () {
        if (textEditingController.text == "") {
          setState(() {
            textEditingController.text = "1";
          });
        }
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: BlocBuilder<LocalizationsBloc, LocalizationsState>(
                builder: (context, state) {
                  return Icon(
                    state.locale.languageCode != 'ar'
                        ? Icons.chevron_left
                        : Icons.chevron_right,
                    color: kCodGray,
                  );
                },
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (cart, totalAmount, totalElements, tempErr) {
                  if (tempErr != null) {
                    context.errorSnackBar(tempErr);
                    setState(() {
                      textEditingController.text = "1";
                    });
                  } else {
                    context.pop();
                  }
                  context.read<QuantityCubit>().reset();
                },
              );
            },
            child: Container(
              constraints: BoxConstraints(
                minHeight: context.height - context.appBarSize,
                maxHeight: context.height - context.appBarSize,
                minWidth: context.width,
                maxWidth: context.width,
              ),
              child: Stack(
                children: [
                  Container(
                    height: context.height - context.appBarSize,
                    width: context.width,
                    constraints: BoxConstraints(
                      minHeight: context.height -
                          context.appBarSize -
                          context.height * 0.17,
                      maxHeight: context.height -
                          context.appBarSize -
                          context.height * 0.17,
                      minWidth: context.width,
                      maxWidth: context.width,
                    ),
                    margin: EdgeInsets.only(
                        right: kSpacingX5,
                        left: kSpacingX5,
                        bottom: kSpacingX4),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            widget.medicament.commercialName ?? '-',
                            maxLines: 5,
                            style: context.textTheme.headlineLarge,
                          ),
                          SizedBox(height: kSpacingX5),
                          ProductDetailsCard(medicament: widget.medicament),
                          SizedBox(height: kSpacingX1),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: context.width,
                        maxWidth: context.width,
                        // maxHeight: context.height * 0.5,
                        // minHeight: context.height * 0.17,
                      ),
                      padding: EdgeInsets.only(
                          top: kSpacingX1,
                          right: kSpacingX5,
                          left: kSpacingX5,
                          bottom: kSpacingX5),
                      decoration: BoxDecoration(
                        color: kCodGray.shade100,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    context.i10n.price,
                                    style: context.textTheme.headlineMedium,
                                  ),
                                  SizedBox(height: kSpacingX1),
                                  BlocBuilder<QuantityCubit, int>(
                                    builder: (context, state) {
                                      return Text(
                                        MoneyHelper.format(
                                            context, unitPrice * state),
                                        style: context.textTheme.headlineLarge!
                                            .copyWith(color: kPrimaryColor),
                                      );
                                    },
                                  ),
                                ],
                              )),
                              Container(
                                padding: EdgeInsets.all(3.h),
                                decoration: BoxDecoration(
                                  color: kCodGray.shade100,
                                  borderRadius:
                                      BorderRadius.circular(kSpacingX12),
                                  border: Border.all(color: kBorder3),
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          int count = (int.tryParse(
                                                  textEditingController.text) ??
                                              1);
                                          if (count > 1) {
                                            textEditingController.text =
                                                "${count - 1}";
                                          }
                                        });
                                        context
                                            .read<QuantityCubit>()
                                            .decrement();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: kCeruleanBlue,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: kCeruleanBlue.shade300,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(3.h),
                                        child: Icon(
                                          Icons.remove,
                                          color: kWhite,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6.h),
                                    SizedBox(
                                      width: 60.h,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          fillColor: kCodGray.shade100,
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                        ),
                                        controller: textEditingController,
                                        focusNode: focus,
                                        onChanged: (value) => context
                                            .read<QuantityCubit>()
                                            .setQuantity(
                                                int.tryParse(value) ?? 1),
                                      ),
                                    ),
                                    SizedBox(width: 6.h),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          int count = (int.tryParse(
                                                  textEditingController.text) ??
                                              1);
                                          textEditingController.text =
                                              "${count + 1}";
                                        });
                                        context
                                            .read<QuantityCubit>()
                                            .increment();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: kCeruleanBlue,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: kCeruleanBlue.shade300,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(3.h),
                                        child: Icon(
                                          Icons.add,
                                          color: kWhite,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          CustomButton(
                            text: context.i10n.addToCart,
                            icon: Icons.shopping_cart,
                            onPressed: () {
                              final int qty =
                                  int.tryParse(textEditingController.text) ?? 1;
                              context.read<CartCubit>().addItemToCart({
                                "medId": widget.medicament.medId,
                                "prdId": widget.medicament.prdId,
                                "stkCode": widget.medicament.stkCode,
                                "qte": qty,
                                "prixPh": unitPrice,
                                "txRistourne":
                                    widget.medicament.ugVnete?.toDouble() ?? 0,
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    super.key,
    required this.medicament,
  });

  final Product medicament;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(kSpacingX5),
        decoration: BoxDecoration(
            color: kCodGray.shade50,
            borderRadius: BorderRadius.circular(kSpacingX1),
            border: Border.all(width: 2.h, color: kCodGray.shade200)),
        child: Column(
          children: [
            // Laboratoire
            Row(
              children: [
                Icon(Icons.science, color: kCodGray.shade700, size: 20.h),
                SizedBox(width: kSpacingX1),
                Expanded(
                  child: Text(context.i10n.laboratoire,
                      style: context.textTheme.titleMedium),
                ),
                Text(
                  (medicament.laboratoire ?? '').isEmpty
                      ? '-'
                      : medicament.laboratoire!,
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Container(height: 1, color: kCodGray.shade200),
            SizedBox(height: kSpacingX5),
            Row(
              children: [
                Icon(
                  Icons.tag,
                  color: kCodGray.shade700,
                  size: 20.h,
                ),
                SizedBox(width: kSpacingX1),
                Expanded(
                  child: Text(
                    context.i10n.lot,
                    style: context.textTheme.titleMedium,
                  ),
                ),
                Text(
                  medicament.nlot ?? '-',
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Container(height: 1, color: kCodGray.shade200),
            SizedBox(height: kSpacingX5),
            // Quantity available
            Row(
              children: [
                Icon(Icons.inventory, color: kCodGray.shade700, size: 20.h),
                SizedBox(width: kSpacingX1),
                Expanded(
                  child: Text(context.i10n.quantity,
                      style: context.textTheme.titleMedium),
                ),
                Text(
                  medicament.qte == null ? '-' : '${medicament.qte}',
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Container(height: 1, color: kCodGray.shade200),
            SizedBox(height: kSpacingX5),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: kCodGray.shade700,
                  size: 20.h,
                ),
                SizedBox(width: kSpacingX1),
                Text(
                  context.i10n.expirationDate,
                  style: context.textTheme.titleMedium,
                ),
                Expanded(
                  child: Text(
                    medicament.datePeremption == null
                        ? '-'
                        : DateFormat('MM/yy')
                            .format(medicament.datePeremption!),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                        ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Container(
              height: 1,
              color: kCodGray.shade200,
            ),
            SizedBox(height: kSpacingX5),
            // PH price
            Row(
              children: [
                Icon(Icons.price_change, color: kCodGray.shade700, size: 20.h),
                SizedBox(width: kSpacingX1),
                Expanded(
                  child: Text(context.i10n.unitPrice,
                      style: context.textTheme.titleMedium),
                ),
                Text(
                  MoneyHelper.format(context, medicament.prixPh ?? 0),
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Container(height: 1, color: kCodGray.shade200),
            SizedBox(height: kSpacingX5),
            Row(
              children: [
                Icon(Icons.percent, color: kCodGray.shade700, size: 20.h),
                SizedBox(width: kSpacingX1),
                Expanded(
                  child: Text('Discount (UG Vente)',
                      style: context.textTheme.titleMedium),
                ),
                Text(
                  medicament.ugVnete == null ? '-' : '${medicament.ugVnete}',
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Container(height: 1, color: kCodGray.shade200),
            SizedBox(height: kSpacingX5),
            // Colis
            Row(
              children: [
                Icon(Icons.all_inbox, color: kCodGray.shade700, size: 20.h),
                SizedBox(width: kSpacingX1),
                Expanded(
                  child: Text('Colis', style: context.textTheme.titleMedium),
                ),
                Text(
                  medicament.colis == null ? '-' : '${medicament.colis}',
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Container(height: 1, color: kCodGray.shade200),
            SizedBox(height: kSpacingX5),
            // TVA
            Row(
              children: [
                Icon(Icons.all_inbox, color: kCodGray.shade700, size: 20.h),
                SizedBox(width: kSpacingX1),
                Expanded(
                  child: Text(context.i10n.tva,
                      style: context.textTheme.titleMedium),
                ),
                Text(
                  medicament.tva == null ? '-' : '${medicament.tva}',
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: kSpacingX5),
            Container(height: 1, color: kCodGray.shade200),
            SizedBox(height: kSpacingX5),
            // Objectif
            Row(
              children: [
                Icon(Icons.track_changes, color: kCodGray.shade700, size: 20.h),
                SizedBox(width: kSpacingX1),
                Expanded(
                  child: Text('Objectif', style: context.textTheme.titleMedium),
                ),
                Text(
                  medicament.objectif == null ? '-' : '${medicament.objectif}',
                  style: context.textTheme.titleMedium!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ],
        ));
  }
}
