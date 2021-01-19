import 'package:flutter_test/flutter_test.dart';
import 'package:clima/api/WeatherbitApi.dart';
import 'package:clima/entities/Clima.dart';

main() {
  group('api clima', () {
    test('retorno cidade NÃO existente', () async {
      Clima clima = await WeatherbitApi.consultarPorCidade('aaaaaaa');
      expect(clima.endereco, isNull);
    });

    test('retorno por nome de cidade existente', () async {
      Clima clima = await WeatherbitApi.consultarPorCidade('Lins');
      expect(clima.endereco.toString(), "Lins / BR");
    });

    test('retorno por posição cidade existente', () async {
      Clima clima =
          await WeatherbitApi.consultarPorPosicao(-21.419583, -50.077013);
      expect(clima.endereco.toString(), "Penápolis / BR");
    });
  });
}
