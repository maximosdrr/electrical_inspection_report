import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/models/traceability_page_data.dart';
import 'package:report_generator/services/pdf_service/utils/image_builder.dart';
import 'package:report_generator/services/pdf_service/widgets/custom_table_type1.dart';
import 'package:report_generator/services/pdf_service/widgets/page_index_item.dart';
import 'package:report_generator/services/pdf_service/widgets/page_index_sub_item.dart';

class TraceabilityPage {
  pw.Column build(TreaceabilityPageData data) {
    return pw.Column(
      children: [
        PageIndexItem.build("2. RASTREABILIDADE"),
        PageIndexSubItem.build("2.1 IDENTIFICAÇÃO"),
        generateCormecialIdentification(data),
        PageIndexSubItem.build("2.2 FASEAMENTO"),
        generateCollectData(data),
        generateTechnicalProcessing(data),
        generateTechnicalResponsability(data),
      ],
    );
  }

  pw.Container generateCormecialIdentification(TreaceabilityPageData data) {
    return pw.Container(
      child: CustomTableType1.build(
        'IDENTIFICAÇÃO COMERCIAL',
        [
          CustomTableType1.buildKeyValueTableRow(
              'Proposta Comercial', data.commercialProposal),
          CustomTableType1.buildKeyValueTableRow(
              'Número da Ordem de Compra', data.purchaseOrderNumber),
          CustomTableType1.buildKeyValueTableRow(
              'Código do Documento', data.documentCode),
          CustomTableType1.buildKeyValueTableRow(
            'Revisão',
            data.revision,
          ),
        ],
      ),
    );
  }

  pw.Container generateCollectData(TreaceabilityPageData data) {
    List<pw.Widget> servicesMonitors = [];

    for (var serviceMonitor in data.monitoringofServices) {
      servicesMonitors.add(
        pw.Container(
          alignment: pw.Alignment.topLeft,
          padding: pw.EdgeInsets.all(10),
          child: pw.Text(
            serviceMonitor,
            style: pw.TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    var servicesMonitorsContainer = pw.Container(
      width: 400,
      child: pw.Column(
        children: servicesMonitors,
      ),
    );

    return pw.Container(
      child: CustomTableType1.build(
        'COLETA DE DADOS',
        [
          CustomTableType1.buildKeyValueTableRow('Data', data.date),
          CustomTableType1.buildKeyValueTableRow(
            'Responsável Técnico',
            data.technicalManager.name,
          ),
          pw.TableRow(
            children: [
              pw.Container(
                width: 120,
                padding: pw.EdgeInsets.all(10),
                child: pw.Text(
                  "Acompanhamento de Serviços",
                  style: pw.TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              servicesMonitorsContainer,
            ],
          )
        ],
      ),
    );
  }

  pw.Container generateTechnicalProcessing(TreaceabilityPageData data) {
    return pw.Container(
      child: CustomTableType1.build(
        'PROCESSAMENTO TÉCNICO',
        [
          CustomTableType1.buildKeyValueTableRow('Período', data.period),
          CustomTableType1.buildKeyValueTableRow(
              'Elaboração', data.elaboration),
          CustomTableType1.buildKeyValueTableRow('Aprovação', data.approval),
        ],
      ),
    );
  }

  pw.Container generateTechnicalResponsability(TreaceabilityPageData data) {
    var digitalSignaturePhoto = buildPdfImage(
      data.digitalSignature,
      fit: pw.BoxFit.fill,
      width: 240,
      height: 120,
    );
    return pw.Container(
      child: CustomTableType1.build(
        'RESPONSABILIDADE TÉCNICA',
        [
          CustomTableType1.buildKeyValueTableRow('Responsável Técnico',
              '${data.technicalManager.name} \n \n ${data.technicalManager.title} \n \n ${data.technicalManager.crea}'),
          CustomTableType1.buildKeyValueTableRow(
              'Número da ART - CREA/SP', data.artNumber),
          pw.TableRow(
            children: [
              pw.Container(
                width: 120,
                padding: pw.EdgeInsets.all(10),
                child: pw.Text(
                  "Assinatura Digital",
                  style: pw.TextStyle(fontSize: 16),
                ),
              ),
              pw.Container(
                width: 400,
                padding: pw.EdgeInsets.all(10),
                alignment: pw.Alignment.center,
                child: digitalSignaturePhoto,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
