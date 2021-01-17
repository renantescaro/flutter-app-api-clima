import 'package:flutter/material.dart';

class Estilos {
  static getTema() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueAccent,
      accentColor: Colors.blue,
      fontFamily: 'Georgia',
    );
  }

  static getCorBotao() {
    return Colors.blueAccent;
  }
}
