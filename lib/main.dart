import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.teal,
        ),
        body: _DicePage(),
      ),
    ),
  );
}

class _DicePage extends StatefulWidget {
  const _DicePage({Key key}) : super(key: key);

  @override
  State<_DicePage> createState() => __DicePageState();
}

class __DicePageState extends State<_DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  int changeDiceFace(int number) {
    number = Random().nextInt(6) + 1;
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = changeDiceFace(leftDiceNumber);
                    });
                  },
                  child: Image.asset(
                    'images/dice$leftDiceNumber.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      rightDiceNumber = changeDiceFace(rightDiceNumber);
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png',
                      width: 150, height: 150),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = changeDiceFace(leftDiceNumber);
                      rightDiceNumber = changeDiceFace(rightDiceNumber);
                    });
                  },
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                      child: const Text('Roll The Dice',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
