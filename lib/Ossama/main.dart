import 'customize_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.amber,
      splashColor: Colors.grey,
      fontFamily: 'lato'
    ),
    home: CustomizeScreen(),
  ));
}