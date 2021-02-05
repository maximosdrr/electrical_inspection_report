import 'package:report_generator/models/introduction_objective_methodology_data.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:report_generator/services/pdf_service/widgets/page_index_item.dart';

class IntroductionObjectiveMethodologyPage {
  build(IntroductionObjectiveMethodologyPageData data) {
    return pw.Column(
      children: [
        PageIndexItem.build("3. INTRODUÇÃO"),
        pw.Container(
          child: generateParagraphs(data.introductionParagraphs),
        ),
        PageIndexItem.build("4. OBJETIVO"),
        pw.Container(
          child: generateParagraphs(data.objectiveParagraphs),
        ),
        PageIndexItem.build("5. METODOLOGIA"),
        pw.Container(
          child: generateParagraphs(data.methodologyParagraphs),
        ),
      ],
    );
  }

  pw.Column generateParagraphs(List<String> paragraphs) {
    List<pw.Widget> generatedParagraphs = [];
    for (String paragraph in paragraphs) {
      generatedParagraphs.add(
        pw.Container(
          child: pw.Text(
            "      $paragraph \n \n",
            style: pw.TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
    }

    return pw.Column(
      children: generatedParagraphs,
    );
  }
}
