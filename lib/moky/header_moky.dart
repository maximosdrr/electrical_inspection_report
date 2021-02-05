import 'dart:io';

import 'package:report_generator/models/header_data.dart';
import 'package:report_generator/services/pdf_service/utils/get_image_file_from_assets.dart';

Future<HeaderData> generateMokyHeaderData() async {
  File logoFromAssets = await getImageFileFromAssets('logo.png');
  return HeaderData(
    code: 'LAUDOINSTELET-PBUTANTA-003',
    review: '0',
    date: '31/10/2020',
    page: '1 / 53',
    title: 'LAUDO DAS INSTALAÇÕES ELÉTRICAS',
    companyLogo: logoFromAssets,
  );
}
