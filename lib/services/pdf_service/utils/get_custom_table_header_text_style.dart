import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:report_generator/services/pdf_service/utils/get_default_colors.dart';

getCustomTableHeaderTextStyle() => pw.TextStyle(
      fontSize: 19,
      fontWeight: pw.FontWeight.bold,
      color: PdfColor.fromHex(documentHexMainWhite()),
    );
