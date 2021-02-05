import 'package:report_generator/models/company_identification_page_data.dart';

CompatyIdentificationData getCompanyIdentificationMoky() {
  return CompatyIdentificationData(
    socialReason: 'Prevent Senior Private Operadora de Saúde Ltda.',
    cnpj: '00.461.479/0047-46',
    unity: 'P.A. Butantã',
    address:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    cep: '05513-100',
    county: 'São Paulo',
    state: 'São Paulo',
    contacts: [
      'Andrea Eugênia Caldeira',
      'Danilo Viana Marinho',
      'Bruno Fernando da Matta e Silva'
    ],
    emails: ['email@teste.com', 'email@teste2.com', 'email@teste3.com'],
    companySite: 'www.preventsenior.com.br',
  );
}
