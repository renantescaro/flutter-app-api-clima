class Clima {
  final String endereco;
  final String data;
  final String urlImagem;
  final double temperatura;
  final double chuva;
  final double umidade;
  final double vento;

  Clima(
      {this.endereco,
      this.data,
      this.urlImagem,
      this.temperatura,
      this.chuva,
      this.umidade,
      this.vento});

  factory Clima.fromJson(dynamic json) {
    return Clima(
      endereco: json['endereco'].toString(),
      data: json['data'].toString(),
      urlImagem: json['urlImagem'].toString(),
      temperatura: double.parse(json['temperatura'].toString()),
      chuva: double.parse(json['chuva'].toString()),
      umidade: double.parse(json['umidade'].toString()),
      vento: double.parse(json['vento'].toString()),
    );
  }
}
