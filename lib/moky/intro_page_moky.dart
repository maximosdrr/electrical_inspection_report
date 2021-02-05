import 'dart:io';

import 'package:report_generator/models/intro_page_data.dart';
import 'package:report_generator/services/pdf_service/utils/get_image_file_from_assets.dart';

Future<IntroPageData> getIntroPageMoky() async {
  File logoFromAssets = await getImageFileFromAssets('logo.png');

  //IntroPageData

  var introPageData = IntroPageData(
    title: 'LAUDO DAS INSTALAÇÕES ELÉTRICAS',
    subtitle: 'SEGURANÇA EM INSTALAÇÕES E SERVIÇOS EM ELETRICIDADE',
    company:
        'PREVENT SENIOR PRIVATE OPERADORA DE SAUDE LTDA.UNIDADE: P.A. BUTANTÃ',
    year: '2020',
    logo: logoFromAssets,
  );

  return introPageData;
}
