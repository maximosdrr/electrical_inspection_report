import 'package:pdf/widgets.dart' as pw;

class PageIndexSubItem {
  static build(String title) {
    return pw.Container(
      alignment: pw.Alignment.topLeft,
      margin: pw.EdgeInsets.only(bottom: 30, top: 30),
      child: pw.Text(
        "$title",
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}
