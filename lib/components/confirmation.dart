import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  final Function(int, int) changeStage;
  final int balance;
  Confirmation({this.changeStage, this.balance});

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {

  TextEditingController _controller = TextEditingController(text: widget.balance);

  @override
  Widget build(BuildContext context) {
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
              onPressed: widget.changeStage(int.parse(_controller.text.toString()) ,1),
              )

          ],
        ),
      ),
    );
  }
}
