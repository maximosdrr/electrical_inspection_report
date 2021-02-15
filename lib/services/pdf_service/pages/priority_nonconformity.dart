import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/models/nonconformityPage_data.dart';
import 'package:report_generator/models/nonconformity_priority_page.dart';
import 'package:report_generator/services/pdf_service/utils/get_custom_table_header_text_style.dart';
import 'package:report_generator/services/pdf_service/utils/get_default_colors.dart';
import 'package:report_generator/services/pdf_service/utils/image_builder.dart';
import 'package:report_generator/services/pdf_service/widgets/page_index_item.dart';
import 'package:pdf/pdf.dart';

class PriorityNonConformityPage {
  build(NonConformityPriorityPageData nonConformityPriorityPageData) {
    List<pw.TableRow> rows = [];

    rows.add(generateHeader());

    for (var item in nonConformityPriorityPageData.nonconformityPriorities) {
      rows.add(
        pw.TableRow(
          children: [
            pw.Container(
              margin: pw.EdgeInsets.only(top: 200),
              alignment: pw.Alignment.center,
              child: pw.Text(
                "${item.index}",
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.Container(
              margin: pw.EdgeInsets.only(top: 10),
              alignment: pw.Alignment.center,
              child: pw.Text(
                "${item.nonConformity}",
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.Container(
              padding: pw.EdgeInsets.all(20),
              child: buildPdfImage(
                item.image,
                width: 240,
                height: 400,
                fit: pw.BoxFit.fill,
              ),
            ),
          ],
        ),
      );
    }

    return pw.Table(
      border: pw.TableBorder.all(
        width: 1,
      ),
      children: rows,
    );
  }

  static pw.TableRow generateHeader() {
    return pw.TableRow(
      decoration: pw.BoxDecoration(
        color: PdfColor.fromHex(documentHexMainColor()),
      ),
      children: [
        pw.Container(
          padding: pw.EdgeInsets.all(10),
          alignment: pw.Alignment.center,
          child: pw.Text(
            "PRIORIDADE",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
        pw.Container(
          padding: pw.EdgeInsets.all(10),
          alignment: pw.Alignment.center,
          child: pw.Text(
            "NÃO CONFORMIDADE",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
        pw.Container(
          padding: pw.EdgeInsets.all(10),
          alignment: pw.Alignment.center,
          child: pw.Text(
            "EXEMPLO IMAGEM",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
      ],
    );
  }
}
