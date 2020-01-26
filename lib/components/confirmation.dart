import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  final Function(int, int) changeStage;
  final int balance;
  Confirmation({this.changeStage, this.balance});

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  
  static String _text;
  TextEditingController _controller = TextEditingController(text: _text);

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
    _text = widget.balance.toString();

    return Container(
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
                  widget.changeStage(int.parse(_controller.text.toString()), 1);
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
