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
}
