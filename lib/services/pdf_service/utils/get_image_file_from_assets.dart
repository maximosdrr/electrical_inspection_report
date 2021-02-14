import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(
    'lib/assets/images/$path',
  );

  final file = File(
    '${(await getTemporaryDirectory()).path}/$path',
  );
  await file.writeAsBytes(
    byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    ),
  );

  return file;
}
//EXEMPLO, NÃO ESQUECER DA EXTENSÃO DA FOTO .PNG OU .JPG
// onPressed: () async {
// File f = await getImageFileFromAssets("logo.png");
// if (f != null) {
//  print(f.path);
// } else {
// print('File is null');
// }
// },
