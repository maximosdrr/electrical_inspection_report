import 'package:report_generator/models/noncoformity_priority.dart';
import 'package:report_generator/models/nonconformity_priority_page.dart';
import 'package:report_generator/services/pdf_service/utils/get_image_file_from_assets.dart';

Future<NonConformityPriorityPageData> getNonconformityPriorityMoky() async {
  List<NonconformityPriority> prioritys = [];

  for (var i = 0; i < 10; i++) {
    prioritys.add(
      NonconformityPriority(
        index: i,
        nonConformity: 'Descrição da não conformidade',
        image: await getImageFileFromAssets('moky_image_1mb.jpg'),
      ),
    );
  }

  return NonConformityPriorityPageData(nonconformityPriorities: prioritys);
}
