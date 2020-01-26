import 'package:flutter/material.dart';
import 'package:stonks/components/confirmation.dart';
import 'package:stonks/components/slider.dart';
import 'package:stonks/money.dart';

class Button extends StatefulWidget {
  final Function(int, int) changeStage;

  Button({this.changeStage});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int balance = 0;
  int stage = 0;

  void _deductBalance() {}

  void changeBalance(int balance) {
    this.balance = balance;
  }

  void changeStage(int stage) {
    this.stage = stage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: (stage == 1)
              ? FlatButton(
                  padding: EdgeInsets.all(16.0),
                )
              : Text("something went wrong :/")),
    );
  }
}
