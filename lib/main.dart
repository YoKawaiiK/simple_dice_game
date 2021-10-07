import 'package:flutter/material.dart';
import 'package:simple_dice_game/screens/dice_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      theme: ThemeData(
        backgroundColor: Colors.black12,
        primarySwatch: Colors.purple,
      ),
      home: DiceScreen(),
    );
  }
}
