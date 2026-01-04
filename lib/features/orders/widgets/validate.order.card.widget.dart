import 'dart:typed_data';

import 'package:crm/core/core.dart';
import 'package:crm/features/orders/blocs/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/person/person.dart';
import '../../../shared/services/helpers/money_helper.dart';
import 'order_add_client_selection.dart';
import '../services/p_d_f_service.dart';

class ValidateOrderCard extends StatefulWidget {
  const ValidateOrderCard({
    super.key,
    required this.total,
    this.generateInvoiceOnValidate = false,
  });

  final num total;
  final bool generateInvoiceOnValidate;

  @override
  State<ValidateOrderCard> createState() => _ValidateOrderCardState();
}

class _ValidateOrderCardState extends State<ValidateOrderCard> {
  bool _isGeneratingPDF = false;

  Future<void> _generateAndDownloadInvoice(Person client) async {
    setState(() {
      _isGeneratingPDF = true;
    });

    try {
      // First, request storage permission
      final hasPermission = await PDFService.requestStoragePermission();
      if (!hasPermission) {
        if (mounted) {
          _showPermissionDialog();
        }
        return;
      }

      final cartState = context.read<CartCubit>().state;
      cartState.maybeWhen(
        loaded: (cart, totalAmount, totalElements, tempErr) async {
          // Generate invoice number (you can customize this logic)
          final invoiceNumber = 'INV-${DateTime.now().millisecondsSinceEpoch}';
          final invoiceDate = DateTime.now();

          // Generate PDF
          final pdfBytes = await PDFService.generateInvoicePDF(
            cartItems: cart,
            client: client,
            totalAmount: totalAmount,
            invoiceNumber: invoiceNumber,
            invoiceDate: invoiceDate,
          );

          // Save PDF to device
          final fileName = 'invoice_$invoiceNumber.pdf';
          final filePath = await PDFService.saveAndDownloadPDF(
            pdfBytes: pdfBytes,
            fileName: fileName,
          );

          if (filePath != null && mounted) {
            context.successSnackBar('Invoice downloaded to: $filePath');
            // Show options dialog
            _showInvoiceOptionsDialog(pdfBytes, fileName);
          } else if (mounted) {
            context.errorSnackBar('Failed to download invoice');
          }
        },
        orElse: () {
          if (mounted) {
            context.errorSnackBar('No cart data available');
          }
        },
      );
    } catch (e) {
      if (mounted) {
        context.errorSnackBar('Error generating invoice: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isGeneratingPDF = false;
        });
      }
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Storage Permission Required'),
          content: Text(
            'This app needs storage permission to save PDF invoices to your device. '
            'Please grant the permission in the next dialog or go to Settings > Apps > Logipharm-CRM > Permissions to enable it manually.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await PDFService.requestStoragePermission();
              },
              child: Text('Grant Permission'),
            ),
          ],
        );
      },
    );
  }

  void _showInvoiceOptionsDialog(Uint8List pdfBytes, String fileName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invoice Generated'),
          content: Text(
              'Your invoice has been generated successfully. What would you like to do?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await PDFService.printPDF(pdfBytes);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.print, size: 16.h),
                  SizedBox(width: 4.w),
                  Text('Print'),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await PDFService.sharePDF(
                  pdfBytes: pdfBytes,
                  fileName: fileName,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.share, size: 16.h),
                  SizedBox(width: 4.w),
                  Text('Share'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBgGrayVisibility2,
        border: Border.all(
            color: kBorder3, strokeAlign: BorderSide.strokeAlignOutside),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingX2,
        vertical: 24.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.i10n.total,
                style: context.textTheme.titleLarge,
              ),
              Expanded(
                child: Text(
                  MoneyHelper.format(context, widget.total.toDouble()),
                  textAlign: TextAlign.end,
                  style: context.textTheme.headlineLarge!
                      .copyWith(color: kPrimaryColor),
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          ),
          SizedBox(height: kSpacingX2),
          OutlinedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 12.h,
                ),
              ),
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kSpacingX1),
                  side: BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
            onPressed: _isGeneratingPDF
                ? null
                : () async {
                    Person? selectedClient = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderAddClientSelection(),
                      ),
                    );

                    if (!context.mounted || selectedClient == null) return;

                    await _generateAndDownloadInvoice(selectedClient);
                  },
            child: _isGeneratingPDF
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16.h,
                        height: 16.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(kPrimaryColor),
                        ),
                      ),
                      SizedBox(width: kSpacingX2),
                      Text(
                        'Generating Invoice...',
                        style: context.textTheme.headlineMedium!
                            .copyWith(color: kPrimaryColor),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 20.h,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: kSpacingX2),
                      Text(
                        'Generate Invoice',
                        style: context.textTheme.headlineMedium!
                            .copyWith(color: kPrimaryColor),
                      ),
                    ],
                  ),
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
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kSpacingX1),
                  side: BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
            onPressed: _isGeneratingPDF
                ? null
                : () async {
                    Person? selectedClient = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderAddClientSelection(),
                      ),
                    );

                    if (!context.mounted || selectedClient == null) return;

                    final confirmed =
                        await _confirmClientSelection(selectedClient);

                    if (!context.mounted || !confirmed) return;

                    // Generate invoice only if enabled
                    if (widget.generateInvoiceOnValidate) {
                      await _generateAndDownloadInvoice(selectedClient);
                      if (!context.mounted) return;
                    }

                    // Validate cart
                    context.read<CartCubit>().validateCart({
                      'clientId': selectedClient.id,
                    });
                    context.successSnackBar(context.i10n.validated);
                  },
            child: _isGeneratingPDF
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16.h,
                        height: 16.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(kBgGrayVisibility1),
                        ),
                      ),
                      SizedBox(width: kSpacingX2),
                      Text(
                        'Generating Invoice...',
                        style: context.textTheme.headlineMedium!
                            .copyWith(color: kBgGrayVisibility1),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        size: 20.h,
                        color: kBgGrayVisibility1,
                      ),
                      SizedBox(width: kSpacingX2),
                      Text(
                        context.i10n.validate,
                        style: context.textTheme.headlineMedium!
                            .copyWith(color: kBgGrayVisibility1),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Future<bool> _confirmClientSelection(Person client) async {
    final productCount = context.read<CartCubit>().state.maybeWhen(
          loaded: (_, __, totalElements, ___) => totalElements,
          orElse: () => 0,
        );

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm client'),
          content: Text(
            'Are you sure you want to make the order for: ${client.fullName}, with $productCount products?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );

    return confirmed ?? false;
  }
}
