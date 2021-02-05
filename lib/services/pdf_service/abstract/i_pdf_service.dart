import 'package:flutter/cupertino.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/models/footer_data.dart';
import 'package:report_generator/models/header_data.dart';

abstract class IPdfService {
  Future<bool> save(pw.Document generatedDocument);
  Future<pw.Document> build(
      HeaderData headerData, FooterData footerData, List<dynamic> pagesContent);
  Future<List<pw.Widget>> generatePages(List<dynamic> pagesContent);
}
