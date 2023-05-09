import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/ui/pages/campo_widget.dart';
import 'package:campo_minado/ui/widgets/resultado_app_bar_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  void _reiniciar() {
    print("Reiniciou");
  }

  void _abrir(Campo campo) {
    print("Abrir");
  }

  void _alternarMarcacao(Campo campo) {
    print("alternar");
  }

  @override
  Widget build(BuildContext context) {
    Campo campoVizinho = Campo(linha: 1, coluna: 1);
    Campo campoVizinho2 = Campo(linha: 1, coluna: 0);
    campoVizinho2.minar();
    campoVizinho.minar();
    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(campoVizinho);
    campo.adicionarVizinho(campoVizinho2);

    try{
      campo.alternarMarcacao();
    }on ExplosaoException{

    }

    return Scaffold(
      appBar: ResultadoAppBarWidget(
        venceu: false,
        onReiniciar: _reiniciar,
      ),
      body: Center(
        child: CampoWidget(
          campo: campo,
          onAbrir: _abrir,
          onAlternarMarcacao: _alternarMarcacao,
        ),
      ),
    );
  }
}
