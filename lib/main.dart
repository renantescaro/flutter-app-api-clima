import 'package:clima/api/WeatherbitApi.dart';
import 'package:clima/views/clima.dart';
import 'package:clima/views/mensagem.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:clima/entities/Clima.dart';
import 'Estilos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Clima'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txtNomeCidade = TextEditingController();
  void _abrirTelaClimaPorCidade(String nomeCidade) async {
    _perguntaNomeCidade();
    if (txtNomeCidade.text.toString() != '') {
      Clima clima = await WeatherbitApi.consultarPorCidade(nomeCidade);
      if (clima.endereco.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClimaView(clima: clima),
            ));
        return;
      }
      Mensagem.simples('Erro ao consultar cidade!', context);
      return;
    }
    Mensagem.simples('Preencha o nome da cidade!', context);
    return;
  }

  void _perguntaNomeCidade() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Qual o nome da cidade?'),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: txtNomeCidade,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Confirmar"),
              onPressed: () {
                Navigator.pop(context);
                _abrirTelaClimaPorCidade(txtNomeCidade.text.toString());
              },
            ),
          ],
        );
      },
    );
  }

  void _abrirTelaClimaPorLocalizacao() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/logo.png'),
              height: 100,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Como você deseja consultar o clima?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: _abrirTelaClimaPorLocalizacao,
                color: Estilos.getCorBotao(),
                child: Text('Consultar por localização',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: _perguntaNomeCidade,
                  color: Estilos.getCorBotao(),
                  child: Text('Consultar pelo nome da cidade',
                      style: TextStyle(color: Colors.white)),
                )),
          ],
        ),
      ),
    );
  }
}
