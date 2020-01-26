import 'package:flutter/material.dart';
import 'package:stonks/money.dart';

class Confirmation extends StatefulWidget {
  final int balance;  // balance received from previous stage
  final Function(int) changeStage;

  Confirmation({this.balance, this.changeStage});

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  TextEditingController _controller = TextEditingController();

  void initState() {
    _controller.value = TextEditingValue(text: widget.balance.toString());

    // controller state management
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
              ),
              TextField(
                controller: TextEditingController(text: "What's this for?"),
              ),
              FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    spendAmount(double.parse(_controller.text.toString()));
                    widget.changeStage(0);
                  })
            ],
          ),
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
