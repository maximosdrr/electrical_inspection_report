import 'package:report_generator/models/traceability_page_data.dart';
import 'package:report_generator/services/pdf_service/utils/get_image_file_from_assets.dart';

Future<TreaceabilityPageData> getTraceabilityMoky() async {
  TechnicalManager technicalManager = TechnicalManager(
    crea: 'CREA-SP: 5063138619',
    name: 'Marcio de Carvalho Soares',
    title: 'Eng. Eletricista e Segurança do Trabalho',
  );
  return TreaceabilityPageData(
    technicalManager: technicalManager,
    approval: 'Eng. Marcio de Carvalho Soares',
    elaboration: 'Eng. Marcio de Carvalho Soares',
    period: '17/10/2020 à 31/10/2020',
    artNumber: '28027230200499655',
    commercialProposal: '022020-021-REV.01',
    date: '16/10/2020',
    digitalSignature: await getImageFileFromAssets('logo.png'),
    documentCode: 'LAUDOINSTELET-PBUTANTA-003',
    monitoringofServices: [
      'Téc. Segurança do Trabalho Aline Miranda',
      'Ass. Manutenção Maurício Melo'
    ],
    purchaseOrderNumber: '723352',
    revision: '0',
  );
}
