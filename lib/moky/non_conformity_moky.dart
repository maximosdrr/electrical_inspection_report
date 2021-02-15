import 'package:report_generator/models/floor.dart';
import 'package:report_generator/models/nonconformity.dart';
import 'package:report_generator/models/nonconformityPage_data.dart';
import 'package:report_generator/models/room.dart';
import 'package:report_generator/services/pdf_service/utils/get_image_file_from_assets.dart';

Future<NonConformityPageData> getNonconformityMoky() async {
  var mokyImage = await getImageFileFromAssets('moky_image_1mb.jpg');
  List<Nonconformity> nonconformitys = [];

  for (var i = 0; i < 3; i++) {
    nonconformitys.add(
      Nonconformity(
        requirement: 'Item 10.4.1 da NR10 e item 8.3.2.2 da ABNT NBR5410.',
        cases:
            'No caso de componentes sem partes móveis, como condutores, barramentos, calhas, canaletas, conectores, terminais, fusíveis, transformadores, etc, deve ser inspecionado o estado geral, verificando-se a existência de sinais de aquecimento e de ressecamentos, além da correta fixação, organização, identificação e limpeza',
        correction:
            'Executar melhoria na organização, passagem e fixação dos condutores e canaletas.',
        image: mokyImage,
        nonConformity: 'Segurança na manutenção - Condutores.',
        index: i,
      ),
    );
  }
  List<Room> rooms = [
    Room(
      index: 1,
      title: 'CASA DE MÁQUINAS DA SALA DE OBSERVAÇÃO',
      nonConformitys: nonconformitys,
    ),
    Room(
      index: 2,
      title: 'DEPÓSITO DE RESÍDUOS',
      nonConformitys: nonconformitys,
    ),
  ];

  List<Floor> floors = [
    Floor(
      index: 1,
      rooms: rooms,
      title: '1º Andar',
    ),
    Floor(
      index: 2,
      rooms: rooms,
      title: '2º Andar',
    ),
  ];

  return NonConformityPageData(floors: floors);
}
