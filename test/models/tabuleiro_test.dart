
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  group("Tabuleiro", (){

    test("Ganhar Jogo", (){
      Tabuleiro tabuleiro = Tabuleiro(linhas: 2,colunas: 2,qtdeBombas: 0);
      tabuleiro.campos[0].minar();
      tabuleiro.campos[3].minar();

      tabuleiro.campos[0].alternarMarcacao();
      tabuleiro.campos[1].abrir();
      tabuleiro.campos[2].abrir();
      tabuleiro.campos[3].alternarMarcacao();

      expect(tabuleiro.resolvido, isTrue);
    });

    test('criação do tabuleiro', () {
      final Tabuleiro tabuleiro = Tabuleiro(linhas: 10, colunas: 10, qtdeBombas: 10);
      expect(tabuleiro.campos.length, equals(100));
      expect(tabuleiro.campos.where((c) => c.minado).length, equals(10));
    });

    test('sorteio de minas', () {
      final Tabuleiro tabuleiro = Tabuleiro(linhas: 10, colunas: 10, qtdeBombas: 10);
      expect(tabuleiro.campos.where((c) => c.minado).length, equals(10));
    });

    test('reinicialização do tabuleiro', () {
      final Tabuleiro tabuleiro = Tabuleiro(linhas: 10, colunas: 10, qtdeBombas: 10);
      tabuleiro.reiniciar();
      expect(tabuleiro.resolvido, isFalse);
    });

  });
}