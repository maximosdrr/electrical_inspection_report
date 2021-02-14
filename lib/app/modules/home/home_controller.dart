import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:report_generator/moky/company_identification_moky.dart';
import 'package:report_generator/moky/footer_moky.dart';
import 'package:report_generator/moky/header_moky.dart';
import 'package:report_generator/moky/intro_page_moky.dart';
import 'package:report_generator/moky/introduction_objective_methodology_moky.dart';
import 'package:report_generator/moky/legal_warning_page_moky.dart';
import 'package:report_generator/moky/non_conformity_moky.dart';
import 'package:report_generator/moky/traceability_moky.dart';
import 'package:report_generator/services/pdf_service/pdf_service.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PdfService pdfService;
  _HomeControllerBase(this.pdfService);

  @action
  generatePdf() async {
    var mokyHeader = await generateMokyHeaderData();
    var mokyFooter = await generateMokyFooterData();
    var introPageMoky = await getIntroPageMoky();
    var legalWarningPageMoky = await getLegalWarningPageMoky();
    var companyIdentificationMoky = getCompanyIdentificationMoky();
    var traceabilityMoky = await getTraceabilityMoky();
    var introductionObjectiveMethodologyMoky =
        getIntroductionObjectivesMethodologyMoky();
    var nonconformityMoky = await getNonconformityMoky();

    var pagesData = [
      introPageMoky,
      legalWarningPageMoky,
      companyIdentificationMoky,
      traceabilityMoky,
      introductionObjectiveMethodologyMoky,
      nonconformityMoky,
    ];

    var generatedDocument =
        await this.pdfService.build(mokyHeader, mokyFooter, pagesData);
    return await this.pdfService.save(generatedDocument);
  }
}
