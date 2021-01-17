import 'package:flutter/material.dart';
import 'package:clima/Estilos.dart';
import 'package:clima/entities/Clima.dart';

class ClimaView extends StatelessWidget {
  ClimaView({this.clima});
  Clima clima;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima',
      theme: Estilos.getTema(),
      home: ClimaPage(clima: clima),
    );
  }
}

class ClimaPage extends StatefulWidget {
  ClimaPage({Key key, this.clima}) : super(key: key);
  Clima clima;
  @override
  _ClimaPageState createState() => _ClimaPageState(clima: clima);
}

class _ClimaPageState extends State<ClimaPage> {
  _ClimaPageState({this.clima});
  Clima clima;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: <Widget>[Text('Endereço: '), Text(clima.endereco)]),
            Row(children: <Widget>[
              Text('Chuva: '),
              Text(clima.chuva.toString() + ' %')
            ]),
            Row(children: <Widget>[
              Text('Temperatura: '),
              Text(clima.temperatura.toString() + ' ºC')
            ]),
            Row(children: <Widget>[
              Text('Umidade: '),
              Text(clima.umidade.toString() + ' %')
            ]),
            Row(children: <Widget>[
              Text('Vento: '),
              Text(clima.vento.toString() + ' m/s')
            ]),
          ],
        ),
      ),
    );
  }
}
