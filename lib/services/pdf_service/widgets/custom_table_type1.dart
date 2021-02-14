import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:report_generator/services/pdf_service/utils/get_custom_table_header_text_style.dart';
import 'package:report_generator/services/pdf_service/utils/get_default_colors.dart';

class CustomTableType1 {
  static build(String title, List<pw.TableRow> rows) {
    return pw.Column(
      children: [
        pw.Container(
          child: pw.Container(
            padding: pw.EdgeInsets.all(10),
            alignment: pw.Alignment.center,
            decoration: pw.BoxDecoration(
              color: PdfColor.fromHex(
                documentHexMainColor(),
              ),
              border: pw.Border.all(
                width: 1,
              ),
            ),
            child: pw.Text(
              "$title",
              style: getCustomTableHeaderTextStyle(),
            ),
          ),
        ),
        pw.Container(
          child: pw.Table(
            border: pw.TableBorder.all(
              width: 1,
            ),
            children: rows,
          ),
        ),
      ],
    );
  }

  static buildKeyValueTableRow(String key, String value) {
    return pw.TableRow(
      children: [
        pw.Container(
          width: 120,
          padding: pw.EdgeInsets.all(10),
          child: pw.Text(
            key,
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        pw.Container(
          width: 400,
          padding: pw.EdgeInsets.all(10),
          child: pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
