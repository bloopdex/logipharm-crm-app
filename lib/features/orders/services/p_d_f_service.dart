import 'dart:io';
import 'dart:typed_data';

import 'package:crm/shared/utils/date.formatter.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';

import '../../../models/person/person.dart';
import '../models/cart/cart_item.dart';

class PDFService {
  static Future<Uint8List> generateInvoicePDF({
    required List<CartItem> cartItems,
    required Person client,
    required num totalAmount,
    required String invoiceNumber,
    required DateTime invoiceDate,
  }) async {
    final pdf = pw.Document();

    // Load a Unicode-supporting font
    final font = await PdfGoogleFonts.notoSansRegular();
    final fontBold = await PdfGoogleFonts.notoSansBold();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        theme: pw.ThemeData.withFont(
          base: font,
          bold: fontBold,
        ),
        build: (pw.Context context) {
          return [
            _buildHeader(invoiceNumber, invoiceDate),
            pw.SizedBox(height: 20),
            _buildClientInfo(client),
            pw.SizedBox(height: 20),
            _buildItemsTable(cartItems),
            pw.SizedBox(height: 20),
            _buildTotal(totalAmount),
            pw.Spacer(),
            _buildFooter(),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildHeader(String invoiceNumber, DateTime invoiceDate) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'INVOICE',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue800,
              ),
            ),
            pw.Text(
              'Invoice #: $invoiceNumber',
              style: const pw.TextStyle(fontSize: 12),
            ),
            pw.Text(
              'Date: ${invoiceDate.day}/${invoiceDate.month}/${invoiceDate.year}',
              style: const pw.TextStyle(fontSize: 12),
            ),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(
              'Biopure',
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text('Your Address Line 1', style: const pw.TextStyle(fontSize: 10)),
            pw.Text('Your Address Line 2', style: const pw.TextStyle(fontSize: 10)),
            pw.Text('Phone: +1234567890', style: const pw.TextStyle(fontSize: 10)),
          ],
        ),
      ],
    );
  }

  static pw.Widget _buildClientInfo(Person client) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Bill To:',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            '${client.firstName} ${client.lastName}',
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          if (client.email != null)
            pw.Text('Email: ${client.email}', style: const pw.TextStyle(fontSize: 10)),
          if (client.tel1Fixe != null)
            pw.Text('Phone: ${client.tel1Fixe}', style: const pw.TextStyle(fontSize: 10)),
        ],
      ),
    );
  }

  static pw.Widget _buildItemsTable(List<CartItem> cartItems) {
    print('Building items table with ${cartItems.length} items');
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey300),
      columnWidths: {
        0: const pw.FlexColumnWidth(3),
        2: const pw.FlexColumnWidth(1.5),
        1: const pw.FlexColumnWidth(1),
        2: const pw.FlexColumnWidth(1.5),
        3: const pw.FlexColumnWidth(1.5),
      },
      children: [
        // Header
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey100),
          children: [
            _buildTableCell("Produit", isHeader: true),
            _buildTableCell("DDP", isHeader: true),
            _buildTableCell('Quantite', isHeader: true),
            _buildTableCell('PU', isHeader: true),
            _buildTableCell('Montant', isHeader: true),
          ],
        ),
        // Items
        ...cartItems.map((item) => pw.TableRow(
              children: [
                _buildTableCell(item.commercialName),
                _buildTableCell(DateHelper.MMYY(item.datePeremption)),
                _buildTableCell('${item.qte.toInt()}'),
                _buildTableCell('${item.prixPh}'),
                _buildTableCell('${item.montant ?? 0.0}'),
              ],
            )),
      ],
    );
  }

  static pw.Widget _buildTableCell(String text, {bool isHeader = false}) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: isHeader ? 12 : 10,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
        textAlign: isHeader ? pw.TextAlign.center : pw.TextAlign.left,
      ),
    );
  }

  static pw.Widget _buildTotal(num totalAmount) {
    return pw.Container(
      alignment: pw.Alignment.centerRight,
      child: pw.Container(
        width: 200,
        padding: const pw.EdgeInsets.all(12),
        decoration: pw.BoxDecoration(
          color: PdfColors.blue50,
          border: pw.Border.all(color: PdfColors.blue200),
          borderRadius: pw.BorderRadius.circular(8),
        ),
        child: pw.Column(
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Subtotal:', style: const pw.TextStyle(fontSize: 12)),
                pw.Text('$totalAmount', style: const pw.TextStyle(fontSize: 12)),
              ],
            ),
            pw.Divider(color: PdfColors.blue200),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Total:',
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  '$totalAmount',
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static pw.Widget _buildFooter() {
    return pw.Container(
      alignment: pw.Alignment.center,
      child: pw.Column(
        children: [
          pw.Divider(color: PdfColors.grey300),
          pw.Text(
            'Thank you for your business!',
            style: pw.TextStyle(
              fontSize: 12,
              fontStyle: pw.FontStyle.italic,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'This is a computer-generated invoice.',
            style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
          ),
        ],
      ),
    );
  }

  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      // Check Android version
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 30) {
        // Android 11+ (API 30+) - Use MANAGE_EXTERNAL_STORAGE
        final status = await Permission.manageExternalStorage.request();
        print('MANAGE_EXTERNAL_STORAGE permission status: $status');
        return status == PermissionStatus.granted;
      } else {
        // Android 10 and below - Use WRITE_EXTERNAL_STORAGE
        final status = await Permission.storage.request();
        print('WRITE_EXTERNAL_STORAGE permission status: $status');
        return status == PermissionStatus.granted;
      }
    }
    return true; // iOS doesn't need explicit permission for app documents
  }

  static Future<String?> saveAndDownloadPDF({
    required Uint8List pdfBytes,
    required String fileName,
  }) async {
    try {
      Directory? directory;

      if (Platform.isAndroid) {
        // Check Android version and permissions
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        final sdkInt = androidInfo.version.sdkInt;

        if (sdkInt >= 30) {
          // Android 11+ - Check if we have MANAGE_EXTERNAL_STORAGE permission
          final hasPermission = await Permission.manageExternalStorage.isGranted;
          if (!hasPermission) {
            final status = await Permission.manageExternalStorage.request();
            if (status != PermissionStatus.granted) {
              throw Exception('Storage permission denied');
            }
          }

          // Try to save to Downloads folder
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            // Fallback to app's external directory
            directory = await getExternalStorageDirectory();
          }
        } else {
          // Android 10 and below
          final hasPermission = await Permission.storage.isGranted;
          if (!hasPermission) {
            final status = await Permission.storage.request();
            if (status != PermissionStatus.granted) {
              throw Exception('Storage permission denied');
            }
          }

          // Try Downloads folder first
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            directory = await getExternalStorageDirectory();
          }
        }
      } else {
        // iOS - Save to Documents folder
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        throw Exception('Could not access storage directory');
      }

      final file = File('${directory.path}/$fileName');
      await file.writeAsBytes(pdfBytes);
      print('PDF saved successfully to: ${file.path}');
      return file.path;
    } catch (e) {
      print('Error saving PDF: $e');
      return null;
    }
  }

  static Future<void> printPDF(Uint8List pdfBytes) async {
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
    );
  }

  static Future<void> sharePDF({
    required Uint8List pdfBytes,
    required String fileName,
  }) async {
    await Printing.sharePdf(
      bytes: pdfBytes,
      filename: fileName,
    );
  }
}
