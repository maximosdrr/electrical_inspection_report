import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/models/intro_page_data.dart';
import 'package:report_generator/services/pdf_service/utils/image_builder.dart';

class IntroPage {
  Future<pw.Container> build(IntroPageData introPageData) async {
    return pw.Container(
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Container(
            margin: pw.EdgeInsets.only(top: 40),
            alignment: pw.Alignment.center,
            child: pw.Text(
              introPageData.title,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 28,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.Container(
            margin: pw.EdgeInsets.only(top: 5),
            alignment: pw.Alignment.center,
            child: pw.Text(
              introPageData.subtitle,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.Container(
            margin: pw.EdgeInsets.only(top: 90),
            alignment: pw.Alignment.center,
            child: buildPdfImage(
              introPageData.logo,
              height: 400,
              width: 280,
              fit: pw.BoxFit.fill,
            ),
          ),
          pw.Container(
            margin: pw.EdgeInsets.only(top: 120),
            alignment: pw.Alignment.center,
            child: pw.Text(
              introPageData.company,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 32,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.Container(
            margin: pw.EdgeInsets.only(top: 30),
            alignment: pw.Alignment.center,
            child: pw.Text(
              introPageData.year,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 32,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
