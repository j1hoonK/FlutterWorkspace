import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dicepage extends StatefulWidget {
  const Dicepage({super.key});

  @override
  State<Dicepage> createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("DiceGame Page"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                      child: Image.asset("assets/images/dice$leftDice.png")),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Image.asset("assets/images/dice$rightDice.png")),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ButtonTheme(
              minWidth: 100,
              height: 60,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.orangeAccent)),
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                      rightDice = Random().nextInt(6) + 1;
                    });
                    showToast("Left Dice: $leftDice // Right Dice: $rightDice");
                  },
                  child: Icon(
                    Icons.play_arrow_sharp,
                    size: 50,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
