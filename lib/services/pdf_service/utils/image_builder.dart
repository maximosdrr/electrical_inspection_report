import 'dart:io';

import 'package:pdf/widgets.dart' as pw;

pw.Image buildPdfImage(
  File file, {
  double width: 200,
  double height: 150,
  pw.BoxFit fit: pw.BoxFit.cover,
}) {
  final image = pw.MemoryImage(
    file.readAsBytesSync(),
  );

  return pw.Image(
    image,
    width: width,
    height: height,
    fit: fit,
  );
}
