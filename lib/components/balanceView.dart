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
  double _fontsize = 32;

  void updateBalanceValue() async {
    double balance = await getBalance();
    setState(() {
      _controllerValue = balance.toString();
    });
  }

  void initState() {
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
      style: TextStyle(fontSize: _fontsize),
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
          hintStyle: TextStyle(fontSize: _fontsize),
          border: InputBorder.none,
          hintText: _controllerValue),
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
      // color: Color(0xFEA832),
      color: Colors.amber,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 100,
                  // minWidth: 100
                ),
                child: _textField),
          ]),
    );
  }
}
