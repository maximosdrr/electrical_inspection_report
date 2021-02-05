import 'package:report_generator/models/footer_data.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/services/pdf_service/utils/image_builder.dart';

class PdfFooter {
  static build(FooterData footerData) {
    return pw.Container(
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Container(
            padding: pw.EdgeInsets.all(5),
            alignment: pw.Alignment.center,
            child: buildPdfImage(
              footerData.qrCode,
              width: 130,
              height: 50,
              fit: pw.BoxFit.contain,
            ),
          ),
          pw.Container(
            child: pw.Text(
              footerData.webSite,
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.Container(
            padding: pw.EdgeInsets.all(5),
            alignment: pw.Alignment.center,
            child: buildPdfImage(
              footerData.logo,
              width: 130,
              height: 50,
              fit: pw.BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
