import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  bool isGameStarted = false;
  final int diceCount = 2;
  List<Image> dices = [];

  final Map<int, String> sideOfDice = {
    0: 'dice/dice1.png',
    1: 'dice/dice2.png',
    2: 'dice/dice3.png',
    3: 'dice/dice4.png',
    4: 'dice/dice5.png',
    5: 'dice/dice6.png',
  };

  void throwDice() {
    const maxNumber = 6;
    const minNumber = 0;
    Random random = Random();

    dices.clear();

    setState(() {
      isGameStarted = true;
    });


    setState(() {
      for (int i = 0; i < diceCount; i++) {
        var generatedNumber = random.nextInt(maxNumber) + minNumber;
        dices.add(Image.asset(sideOfDice[generatedNumber]!, scale: 0.8));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      body: SafeArea(
        child: isGameStarted
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      itemCount: dices.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: diceCount),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: dices[index],
                        );
                      },
                    ),
                  )
                ],
              ),
              IntrinsicWidth(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MaterialButton(
                      color: Colors.red[100],
                      child: Text('Roll'),
                      onPressed: throwDice,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : Center(
          child: MaterialButton(
            child: Text('play'),
            color: Colors.purple,
            onPressed: throwDice,
          ),
        ),
      ),
    );
  }
}
