import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/models/header_data.dart';
import 'package:report_generator/services/pdf_service/utils/image_builder.dart';
import 'package:report_generator/services/pdf_service/widgets/key_value_text.dart';

class PdfHeader {
  static build(HeaderData headerData, int pageNumber, int pageCount) {
    return pw.Container(
      margin: pw.EdgeInsets.only(bottom: 30),
      child: pw.Table(
        border: pw.TableBorder.all(
          width: 1,
        ),
        children: [
          pw.TableRow(
            children: [
              pw.Container(
                padding: pw.EdgeInsets.all(5),
                alignment: pw.Alignment.center,
                child: buildPdfImage(
                  headerData.companyLogo,
                  width: 130,
                  height: 50,
                  fit: pw.BoxFit.contain,
                ),
              ),
              pw.Container(
                height: 50,
                padding: pw.EdgeInsets.all(10),
                alignment: pw.Alignment.center,
                child: PdfKeyValueText.build(
                  'Titulo',
                  headerData.title,
                  // fontWeight: pw.FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          pw.TableRow(children: [
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              alignment: pw.Alignment.center,
              child: PdfKeyValueText.build('Código', headerData.code),
            ),
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              alignment: pw.Alignment.center,
              child: PdfKeyValueText.build('Revisão', headerData.review),
            ),
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              alignment: pw.Alignment.center,
              child: PdfKeyValueText.build('Data', headerData.date),
            ),
            pw.Container(
              padding: pw.EdgeInsets.all(10),
              alignment: pw.Alignment.center,
              child:
                  PdfKeyValueText.build('Página', '$pageNumber / $pageCount'),
            ),
          ]),
        ],
      ),
    );
  }
}
