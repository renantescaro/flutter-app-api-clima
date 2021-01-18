import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static final String ip = '192.168.0.5:5000';
  static final String urlApi = 'http://' + ip + '/';

  static getHttp(String url) async {
    try {
      final response = await http.get(url, headers: {
        "Accept": "application/json",
      });

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return jsonEncode(
            {'mensagem': 'Erro resposta servidor', 'sucesso': false});
      }
    } catch (e) {
      return jsonEncode(
          {'mensagem': 'Erro ao acessar servidor', 'sucesso': false});
    }
  }
}
