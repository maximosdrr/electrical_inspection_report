import 'package:report_generator/models/nonconformity.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/services/pdf_service/utils/get_custom_table_header_text_style.dart';
import 'package:report_generator/services/pdf_service/utils/get_default_colors.dart';
import 'package:report_generator/services/pdf_service/utils/image_builder.dart';

class CustomTableNonConformity {
  static pw.Column build(List<Nonconformity> nonconformitys) {
    List<pw.Row> tableRows = [];
    var generatedNonconformityRows = generateNonconformityRows(nonconformitys);
    // tableRows.add(generateHeader());
    for (var generatedNonconformityRow in generatedNonconformityRows) {
      tableRows.add(generatedNonconformityRow);
    }
    return pw.Column(
      children: tableRows,
    );
  }

  static pw.TableRow generateHeader() {
    return pw.TableRow(
      decoration: pw.BoxDecoration(
        color: PdfColor.fromHex(documentHexMainColor()),
      ),
      children: [
        pw.Container(
          alignment: pw.Alignment.center,
          child: pw.Text(
            "ITEM",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
        pw.Container(
          alignment: pw.Alignment.center,
          child: pw.Text(
            "DESCRIÇÃO",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
        pw.Container(
          alignment: pw.Alignment.center,
          child: pw.Text(
            "FOTO",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
      ],
    );
  }

  static List<pw.Row> generateNonconformityRows(
      List<Nonconformity> nonconformitys) {
    List<pw.Row> nonconformitysRows = [];
    for (var nonconformity in nonconformitys) {
      nonconformitysRows.add(
        pw.Row(
          children: [
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              alignment: pw.Alignment.center,
              child: pw.Text(
                '${nonconformity.index}',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              child: pw.Text(
                "Requisito: ${nonconformity.requirement}\n\n\nNão Conformidade: ${nonconformity.nonConformity}\n\n\nCaso: ${nonconformity.cases}\n\n\nCorreção: ${nonconformity.correction}",
                style: pw.TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              child: buildPdfImage(
                nonconformity.image,
                fit: pw.BoxFit.fill,
                width: 190,
                height: 280,
              ),
            ),
          ],
        ),
      );
    }
    return nonconformitysRows;
  }
}
