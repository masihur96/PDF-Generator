import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdf_tester/api/pdf_api.dart';

class PdfInvoiceApi {
  static Future<File> generate(String invoice, BuildContext context) async {
    final pdf = Document();
    pw.MemoryImage imageFromBase64String(String base64) {
      return pw.MemoryImage(base64Decode(base64));
    }

    pdf.addPage(MultiPage(
      build: (context) => [
        pw.Image(
          imageFromBase64String(invoice),
          height: 500,
          width: 500,
        ),
      ],
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
}
