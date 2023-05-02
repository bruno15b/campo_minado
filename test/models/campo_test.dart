import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Campo Testes", () {
    test("Abrir campo com explosão", () {
      Campo c = Campo(coluna: 0, linha: 0);
      c.minar();
      expect(c.abrir, throwsException);
    });

    test("Abrir campo sem explosão", () {
      Campo c = Campo(coluna: 0, linha: 0);
      c.abrir();
      expect(c.aberto, isTrue);
    });

    test("Adicionar vizinho", () {
      Campo c1 = Campo(linha: 1, coluna: 0);
      Campo c2 = Campo(linha: 1, coluna: 1);
      c1.adicionarVizinho(c2);

      expect(c1.vizinhos.isNotEmpty, isTrue);
    });

    test("Não adicionar vizinho", () {
      Campo c1 = Campo(linha: 0, coluna: 0);
      Campo c2 = Campo(linha: 1, coluna: 3);
      c1.adicionarVizinho(c2);

      expect(c1.vizinhos.isEmpty, isTrue);
    });

    test("Minas na vizinhança", () {
      Campo c1 = Campo(linha: 3, coluna: 3);
      Campo c2 = Campo(linha: 3, coluna: 4);
      Campo c3 = Campo(linha: 2, coluna: 2);
      Campo c4 = Campo(linha: 4, coluna: 4);

      c2.minar();
      c4.minar();

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);

      expect(c1.qtdeMinasNaVizinhanca, 2);
    });

    test("Alternar marcação", () {
      Campo c8 = Campo(coluna: 0, linha: 0);
      expect(c8.marcado, isFalse);
      c8.alternarMarcacao();
      expect(c8.marcado, isTrue);
      c8.alternarMarcacao();
      expect(c8.marcado, isFalse);
    });

    test("Revelar bomba", () {
      Campo c7 = Campo(coluna: 0, linha: 0);
      c7.minar();
      c7.revelarBomba();
      expect(c7.aberto, isTrue);
    });

    test("Campo resolvido", () {
      Campo c1 = Campo(linha: 0, coluna: 0);
      Campo c2 = Campo(linha: 1, coluna: 1);
      c2.minar();
      c1.adicionarVizinho(c2);

      expect(c1.resolvido, isFalse);

      c1.alternarMarcacao();
      expect(c1.resolvido, isFalse);

      c1.abrir();
      expect(c1.resolvido, isTrue);
    });

  });
}
