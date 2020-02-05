import 'package:flutter/material.dart';
import 'package:stonks/money.dart';

class BalanceView extends StatefulWidget {
  @override
  _BalanceViewState createState() => _BalanceViewState();
}

class _BalanceViewState extends State<BalanceView> {
  TextEditingController _controller = TextEditingController();
  String _controllerValue;
  Widget _textField;

  void updateBalanceValue() async {
    double balance = await getBalance();
    setState(() {
      _controllerValue = balance.toString();
    });
  }

  void initState() {
    // _controllerValue = getBalance().toString();

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

  void setWidgets() {
    _textField = TextField(
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  setBalance(double.parse(_controller.text.toString()));
                  _controller.clear();
                  setState(() {
                    updateBalanceValue();
                  });
                },
                keyboardType: TextInputType.number,
                controller: _controller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: _controllerValue),
                onChanged: (v) => setState(() {
                  _controllerValue = v;
                }),
              );
  }

  @override
  Widget build(BuildContext context) {

    setWidgets();
    updateBalanceValue();

    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: _textField
            ),
          ]),
    );
  }
}
