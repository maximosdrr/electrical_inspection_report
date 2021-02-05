import 'dart:io';

import 'package:report_generator/models/footer_data.dart';
import 'package:report_generator/services/pdf_service/utils/get_image_file_from_assets.dart';

Future<FooterData> generateMokyFooterData() async {
  File logoFromAssets = await getImageFileFromAssets('logo.png');
  File qrCodeFromAssets = await getImageFileFromAssets('qr_code.png');

  return FooterData(
    webSite: 'w w w . m a r c i o s o a r e s . e n g . b r',
    logo: logoFromAssets,
    qrCode: qrCodeFromAssets,
  );
}
