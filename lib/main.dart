import 'package:flutter/material.dart';
import 'package:flutter_side_menu/screens/main_menu.dart';

void main() => runApp(StartApp());

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Side Bar App",
      home: MainMenu(),
    );
  }
}
