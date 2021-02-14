import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/models/nonconformity.dart';
import 'package:report_generator/models/nonconformityPage_data.dart';
import 'package:report_generator/services/pdf_service/utils/get_custom_table_header_text_style.dart';
import 'package:report_generator/services/pdf_service/utils/get_default_colors.dart';
import 'package:report_generator/services/pdf_service/utils/image_builder.dart';
import 'package:pdf/pdf.dart';
import 'package:report_generator/services/pdf_service/widgets/page_index_item.dart';
import 'package:report_generator/services/pdf_service/widgets/page_index_sub_item.dart';

class NonConformityPage {
  pw.Column build(NonConformityPageData nonConformityPageData) {
    List<pw.Widget> itens = [];
    itens.add(PageIndexItem.build("6. LAUDO DAS INSTALAÇÕES ELÉTRICAS"));
    for (var floor in nonConformityPageData.floors) {
      itens.add(
        pw.Container(
          child: PageIndexSubItem.build(
            "6.${floor.index} ${floor.title}",
          ),
        ),
      );
      for (var room in floor.rooms) {
        itens.add(
          pw.Container(
            child: PageIndexSubItem.build(
              "6.${floor.index}.${room.index} ${room.title}",
            ),
          ),
        );
        for (int i = 0; i < room.nonConformitys.length; i++) {
          itens.add(
            generateNonConformityItem(room.nonConformitys[i], i == 0),
          );
        }
      }
    }
    return pw.Column(
      children: itens,
    );
  }

  pw.Table generateNonConformityItem(
      Nonconformity nonconformity, bool isPrimary) {
    return pw.Table(
      border: pw.TableBorder.all(
        width: 1,
      ),
      children: isPrimary
          ? [
              generateHeader(),
              pw.TableRow(
                children: [
                  pw.Container(
                    width: 70,
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
                    width: 360,
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
            ]
          : [
              pw.TableRow(
                children: [
                  pw.Container(
                    width: 70,
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
                    width: 360,
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
            ],
    );
  }

  pw.TableRow generateHeader() {
    return pw.TableRow(
      decoration: pw.BoxDecoration(
        color: PdfColor.fromHex(documentHexMainColor()),
      ),
      children: [
        pw.Container(
          width: 70,
          padding: pw.EdgeInsets.all(10),
          alignment: pw.Alignment.center,
          child: pw.Text(
            "ITEM",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
        pw.Container(
          width: 360,
          padding: pw.EdgeInsets.all(10),
          alignment: pw.Alignment.center,
          child: pw.Text(
            "DESCRIÇÃO",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
        pw.Container(
          padding: pw.EdgeInsets.all(10),
          alignment: pw.Alignment.center,
          width: 190,
          child: pw.Text(
            "FOTO",
            style: getCustomTableHeaderTextStyle(),
          ),
        ),
      ],
    );
  }
}
