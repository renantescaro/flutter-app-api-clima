class Clima {
  final String endereco;
  final String data;
  final String urlImagem;
  final String clima;
  final double temperatura;
  final double umidade;
  final double vento;

  Clima(
      {this.endereco,
      this.data,
      this.urlImagem,
      this.temperatura,
      this.clima,
      this.umidade,
      this.vento});

  factory Clima.fromJson(dynamic json) {
    return Clima(
      endereco: json['endereco'],
      data: json['data'],
      urlImagem: json['urlImagem'],
      clima: json['clima'],
      temperatura: double.tryParse(json['temperatura'].toString()) ?? 0,
      umidade: double.tryParse(json['umidade'].toString()) ?? 0,
      vento: double.tryParse(json['vento'].toString()) ?? 0,
    );
  }
}
