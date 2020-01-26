import 'package:flutter/material.dart';
import 'package:stonks/components/button.dart';
import 'package:stonks/components/confirmation.dart';
import 'package:stonks/components/buttonSlider.dart';
import 'package:stonks/money.dart';

class Mechanism extends StatefulWidget {
  @override
  _MechanismState createState() => _MechanismState();
}

class _MechanismState extends State<Mechanism> {
  int stage = 0;
  int balance = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (stage == 0)
            ? ButtonSlider(
                balance: balance,
                changeBalance: changeBalance,
                changeStage: changeStage)
            : (stage == 1)
                ? Confirmation(
                    balance: balance,
                    changeStage: changeStage)
                : Text("Sorry, something went wrong :/"));
  }

  void changeBalance(int balance) {
    this.balance = balance;
  }

  void changeStage(int stage) async {
    setState(() {
      this.stage = stage;
    });

    // DEBUG
    double _balance = await getBalance();
    print("Balance: " + _balance.toString());
    // END DEBUG
  }
}
