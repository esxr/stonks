import 'package:flutter/material.dart';
import 'package:stonks/money.dart';

class Confirmation extends StatefulWidget {
  final int balance; // balance received from previous stage
  final Function(int) changeStage;

  Confirmation({this.balance, this.changeStage});

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  TextEditingController _controller = TextEditingController();

  String _controllerValue;

  void debugBalance() async {
    // DEBUG
    double _balance = await getBalance();
    print("Balance: " + _balance.toString());
    // END DEBUG
  }

  void initState() {
    _controllerValue = widget.balance.toString();

    // controller state management
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
      _controllerValue = _controller.text.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: _controllerValue)),
              TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What's  this for ?")),
              FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    spendAmount(double.parse(_controllerValue));
                    debugBalance();
                    print(_controllerValue.toString());
                    widget.changeStage(0);
                  })
            ],
          ),
        ),
      );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
}
