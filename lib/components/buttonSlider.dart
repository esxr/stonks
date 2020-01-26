import 'package:flutter/material.dart';

class ButtonSlider extends StatefulWidget {
  final int balance;
  final Function(int) changeBalance;
  final Function(int) changeStage;

  ButtonSlider({this.balance, this.changeBalance, this.changeStage});

  @override
  _ButtonSliderState createState() => _ButtonSliderState();
}

class _ButtonSliderState extends State<ButtonSlider> {
  double _sliderValue;
  bool pressed;

  void initState() {
    pressed = false;
    _sliderValue = widget.balance.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Listener(
            onPointerDown: (details) {
              setState(() {
                pressed = true;
              });
            },
            onPointerUp: (details) {
              // change balance and stage on release
              widget.changeBalance(_sliderValue.round());
              widget.changeStage(1);
            },
            child: pressed
                ? Slider(
                    activeColor: Colors.indigoAccent,
                    min: 0.0,
                    max: 100,
                    divisions: 10,
                    onChangeEnd: (value) {
                      // change the balance accordingly
                      widget.changeBalance(value.round());
                    },
                    onChanged: (value) {
                      // change slider appearance
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                    value: _sliderValue,
                  )
                : FlatButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text("Spend"))));
  }
}
