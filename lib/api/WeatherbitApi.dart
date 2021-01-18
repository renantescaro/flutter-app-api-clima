import 'package:clima/entities/Clima.dart';
import 'package:clima/Api/Api.dart';
import 'dart:convert';
import 'dart:developer' as dev;

class WeatherbitApi {
  static Future<Clima> consultarPorCidade(String cidade) async {
    dynamic resposta =
        await Api.getHttp(Api.urlApi + '/cidade/' + cidade + '/BR');
    dynamic respostaJson = json.decode(resposta);
    return new Clima.fromJson(respostaJson);
  }
}
