import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:report_generator/models/footer_data.dart';
import 'package:report_generator/models/header_data.dart';
import 'package:report_generator/models/traceability_page_data.dart';
import 'package:report_generator/services/pdf_service/abstract/i_pdf_service.dart';
import 'package:report_generator/services/pdf_service/pages/company_identification.dart';
import 'package:report_generator/services/pdf_service/pages/intro.dart';
import 'package:report_generator/services/pdf_service/pages/introduction_objective_methodology.dart';
import 'package:report_generator/services/pdf_service/pages/legal_warning.dart';
import 'package:report_generator/services/pdf_service/pages/nonconformity.dart';
import 'package:report_generator/services/pdf_service/pages/traceability.dart';
import 'package:report_generator/services/pdf_service/utils/get_download_path.dart';
import 'package:report_generator/services/pdf_service/utils/get_permission.dart';
import 'package:report_generator/services/pdf_service/widgets/pdf_footer.dart';
import 'package:report_generator/services/pdf_service/widgets/pdf_header.dart';

class PdfService implements IPdfService {
  @override
  Future<List<pw.Widget>> generatePages(List<dynamic> pagesContent) async {
    List<pw.Widget> pages = [];

    //Paginas
    IntroPage introPage = IntroPage();
    LegalWarningPage legalWarningPage = LegalWarningPage();
    CompanyIndentification companyIndentification = CompanyIndentification();
    TraceabilityPage treaceabilityPage = TraceabilityPage();
    IntroductionObjectiveMethodologyPage introductionObjectiveMethodologyPage =
        IntroductionObjectiveMethodologyPage();
    NonConformityPage nonConformityPage = NonConformityPage();

    //Geração de paginas e adição na lista de retorno
    try {
      //Introdução
      var generatedIntroPage = await introPage.build(pagesContent[0]);
      pages.add(generatedIntroPage);
      //Aviso Legal
      var generateLegalWarningPage =
          await legalWarningPage.build(pagesContent[1]);
      pages.add(generateLegalWarningPage);
      //Indetificação da Empresa
      var companyIdentificationPage =
          companyIndentification.build(pagesContent[2]);
      pages.add(companyIdentificationPage);
      //Identificação da Empresa
      var generatedTraceabilityPage = treaceabilityPage.build(pagesContent[3]);
      pages.add(generatedTraceabilityPage);
      //Introdução Objetivos e Metodologia
      var generatedIntroductionObjectivesMethodologyPage =
          introductionObjectiveMethodologyPage.build(pagesContent[4]);
      pages.add(generatedIntroductionObjectivesMethodologyPage);
      //Pagina de não conformidades
      var generatedNonCoformityPage = nonConformityPage.build(pagesContent[5]);
      pages.add(generatedNonCoformityPage);
      return pages;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<pw.Document> build(
    HeaderData headerData,
    FooterData footerData,
    List<dynamic> pagesContent,
  ) async {
    try {
      final pdf = pw.Document();
      var generatedPages = await generatePages(pagesContent);
      pdf.addPage(
        pw.MultiPage(
          maxPages: 2000,
          pageFormat: PdfPageFormat.a3,
          header: (context) => PdfHeader.build(
              headerData, context.pageNumber, context.pagesCount),
          footer: (context) => PdfFooter.build(footerData),
          build: (pw.Context context) {
            return generatedPages;
          },
        ),
      );
      return pdf;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> save(pw.Document generatedDocument) async {
    try {
      await permissionHandler();
      final downloadPath = await getDownloadPath();
      final pdfId = DateTime.now().millisecond.toString();
      final pdfToSave = File('$downloadPath/Relatorio_$pdfId.pdf');
      await pdfToSave.writeAsBytes(await generatedDocument.save());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
