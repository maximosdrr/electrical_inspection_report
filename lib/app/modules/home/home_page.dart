import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var load = FlushbarHelper.createLoading(
      message: 'Aguarde...',
      linearProgressIndicator: LinearProgressIndicator(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: RaisedButton(
                child: Text("Gerar"),
                onPressed: () async {
                  load.show(context);
                  var createPdfSuccess = await controller.generatePdf();
                  if (createPdfSuccess) {
                    load.dismiss();
                    FlushbarHelper.createSuccess(message: 'Salvo com sucesso')
                        .show(context);
                  } else {
                    load.dismiss();
                    FlushbarHelper.createError(message: 'Algo deu errado')
                        .show(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
