import 'package:flutter/material.dart';
import 'package:stonks/components/button.dart';
import 'package:stonks/components/confirmation.dart';
import 'package:stonks/components/slider.dart';
import 'package:stonks/money.dart';

class Mechanism extends StatefulWidget {
  @override
  _MechanismState createState() => _MechanismState();
}

class _MechanismState extends State<Mechanism> {
  int stage = 1;
  int balance = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (stage == 0)
            ? Button()
            : (stage == 1)
                ? MoneySlider(changeStage: changeStage)
                : (stage == 2)
                    ? Confirmation(
                        changeStage: changeStage,
                        balance: this.balance,
                      )
                    : Text("Sorry, something went wrong :/"));
  }

  void changeStage(amount, stage) async {
    setState(() {
      this.balance = amount;
      this.stage = stage;
    });

    if(stage==2) { spendAmount(amount.toString()); } // spend the amount after confirmation
    String balance = await getBalance();
    print("Balance: " + balance);
  }
}
