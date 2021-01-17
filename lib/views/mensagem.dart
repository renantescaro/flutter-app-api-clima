import 'package:flutter/material.dart';

class Mensagem {
  static Future<void> simples(mensagem, context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[Text(mensagem, textAlign: TextAlign.left)],
        );
      },
    );
  }

  Future<String> pertuntaEntradaTexto(context, String pergunta) async {
    TextEditingController txtRespostaPergunta = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(pergunta),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: txtRespostaPergunta,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Confirmar"),
              onPressed: () {
                Navigator.pop(context, 'success');
              },
            ),
          ],
        );
      },
    );
  }
}
