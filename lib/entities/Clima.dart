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
      endereco: json['endereco'],
      data: json['data'],
      urlImagem: json['urlImagem'],
      temperatura: double.tryParse(json['temperatura'].toString()) ?? 0,
      chuva: double.tryParse(json['chuva'].toString()) ?? 0,
      umidade: double.tryParse(json['umidade'].toString()) ?? 0,
      vento: double.tryParse(json['vento'].toString()) ?? 0,
    );
  }
}
