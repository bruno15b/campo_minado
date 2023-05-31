import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:campo_minado/ui/widgets/resultado_app_bar_widget.dart';
import 'package:campo_minado/ui/widgets/tabuleiro_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu;
  Tabuleiro _tabuleiro;

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) {
      return;
    }
    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    setState(() {
      campo.alternarMarcacao();
      if (_tabuleiro.resolvido) {
        _venceu = true;
      }
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdeColunas = 15;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(linhas: qtdeLinhas, colunas: qtdeColunas, qtdeBombas: 50);

      return _tabuleiro;
    }
    return _tabuleiro;
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

    try {
      campo.alternarMarcacao();
    } on ExplosaoException {}

    return Scaffold(
      appBar: ResultadoAppBarWidget(
        venceu: _venceu,
        onReiniciar: _reiniciar,
      ),
      body: Container(
        color: Colors.grey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return TabuleiroWidget(
                tabuleiro: _getTabuleiro(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onAbrir: _abrir,
                onAlternarMarcacao: _alternarMarcacao);
          },
        ),
      ),
    );
  }
}
