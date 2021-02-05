import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/models/legal_warning_page_data.dart';

class LegalWarningPage {
  Future<pw.Container> build(LegalWarningPageData introPageData) async {
    return pw.Container(
      child: pw.Column(
        children: generateData(introPageData),
      ),
    );
  }

  List<pw.Container> generateData(LegalWarningPageData introPageData) {
    List<pw.Container> paragraphs = [];

    paragraphs.add(
      pw.Container(
        alignment: pw.Alignment.center,
        margin: pw.EdgeInsets.only(top: 30, bottom: 30),
        child: pw.Text(
          introPageData.title,
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(
            fontSize: 28,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
      ),
    );

    for (var paragraph in introPageData.paragraphs) {
      paragraphs.add(
        pw.Container(
          margin: pw.EdgeInsets.only(
            bottom: 30,
          ),
          child: pw.Text(
            '    $paragraph',
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
    }

    return paragraphs;
  }
}
