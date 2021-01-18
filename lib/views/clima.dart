import 'package:flutter/material.dart';
import 'package:clima/Estilos.dart';
import 'package:clima/entities/Clima.dart';
import 'package:clima/api/Api.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(children: <Widget>[
                  Image.network(Api.urlApi + clima.urlImagem),
                  Text(
                    clima.temperatura.toString() + ' ºC',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ]),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                clima.endereco.toString(),
                style: TextStyle(fontSize: 30),
              )
            ]),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('Chuva: '),
              Text(clima.chuva.toString() + ' %')
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('Umidade: '),
              Text(clima.umidade.toString() + ' %')
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('Vento: '),
              Text(clima.vento.toString() + ' m/s')
            ]),
          ],
        ),
      ),
    );
  }
}
