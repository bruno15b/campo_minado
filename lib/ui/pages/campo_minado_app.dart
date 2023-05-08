import 'package:campo_minado/ui/widgets/resultado_app_bar_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  _reiniciar() {
    print("Reiniciou");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultadoAppBarWidget(
        venceu: true,
        onReiniciar: _reiniciar,
      ),
      body: Center(
        child: Text("Tabuleiro"),
      ),
    );
  }
}
