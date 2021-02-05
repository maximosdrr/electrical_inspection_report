import 'package:report_generator/models/company_identification_page_data.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/services/pdf_service/widgets/custom_table_type1.dart';

class CompanyIndentification {
  pw.Container build(CompatyIdentificationData data) {
    return pw.Container(
      child: pw.Column(children: [
        pw.Container(
          alignment: pw.Alignment.topLeft,
          margin: pw.EdgeInsets.only(bottom: 30),
          child: pw.Text(
            "1.  IDENTIFICAÇÃO DA EMPRESA",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        generateTableCompanyIdentification(data),
        generateLocalizationTable(data),
      ]),
    );
  }

  pw.Container generateTableCompanyIdentification(
      CompatyIdentificationData data) {
    return pw.Container(
      child: CustomTableType1.build(
        "IDENTIFICAÇÃO DA EMPRESA",
        [
          CustomTableType1.buildKeyValueTableRow(
              'Razão Social', data.socialReason),
          CustomTableType1.buildKeyValueTableRow('CNPJ', data.cnpj),
          CustomTableType1.buildKeyValueTableRow('UNIDADE', data.unity),
        ],
      ),
    );
  }

  pw.Container generateLocalizationTable(CompatyIdentificationData data) {
    List<pw.TableRow> rows = [];

    rows.add(CustomTableType1.buildKeyValueTableRow("Endereço", data.address));

    rows.add(CustomTableType1.buildKeyValueTableRow("CEP", data.cep));

    rows.add(CustomTableType1.buildKeyValueTableRow("Município", data.county));

    rows.add(CustomTableType1.buildKeyValueTableRow("Estado", data.state));

    for (var email in data.emails) {
      rows.add(CustomTableType1.buildKeyValueTableRow("Email", email));
    }

    for (var contact in data.contacts) {
      rows.add(CustomTableType1.buildKeyValueTableRow("Contato", contact));
    }

    rows.add(
      CustomTableType1.buildKeyValueTableRow(
          "Site da Empresa", data.companySite),
    );

    return pw.Container(
      child: CustomTableType1.build(
        "LOCALIZAÇÃO",
        rows,
      ),
    );
  }
}
