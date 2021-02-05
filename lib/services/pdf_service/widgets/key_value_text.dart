import 'package:pdf/widgets.dart' as pw;

class PdfKeyValueText {
  static build(
    String key,
    String value, {
    double fontSize: 10,
    pw.FontWeight fontWeight: pw.FontWeight.bold,
    pw.TextAlign textAlign: pw.TextAlign.left,
  }) {
    return pw.Text(
      "$key: $value",
      style: pw.TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
