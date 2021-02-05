import 'package:report_generator/app/modules/home/home_controller.dart';
import 'package:report_generator/services/pdf_service/pdf_service.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:report_generator/app/app_widget.dart';
import 'package:report_generator/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        //Services
        Bind((i) => PdfService()),
        //Controllers
        Bind((i) => HomeController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
