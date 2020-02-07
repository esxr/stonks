import 'package:flutter/material.dart';
import 'package:stonks/components/balanceView.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  Widget button, slider;

  double _buttonOpacity, _sliderOpacity;

  void initState() {
    _buttonOpacity = 1;
    _sliderOpacity = 0;
    _sliderValue = 50;
    super.initState();
  }

  void setWidgets() {
    // set the button
    button = Opacity(
        opacity: _buttonOpacity,
        child: Center(
          child: GestureDetector(
            child: SvgPicture.asset(
              "assets/images/dollar.svg",
              placeholderBuilder: (context) => Icon(Icons.error),
              height: 128.0,
            ),
            // child: Text("Spend")
          ),
        ));

    // set the slider
    slider = Opacity(
      opacity: _sliderOpacity,
      child: RotatedBox(
        quarterTurns: 3,
        child: Slider(
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
        ),
      ),
    );
  }

  setStage(bool pressed) {
    double op = 0;

    if (pressed) {
      op = 1;
    }

    setState(() {
      _sliderOpacity = op;
      _buttonOpacity = 1 - op;
    });
  }

  @override
  Widget build(BuildContext context) {
    setWidgets();

    return Container(
        child: Listener(
            onPointerDown: (details) {
              setStage(true);
            },
            onPointerUp: (details) {
              // change balance and stage on release
              widget.changeBalance(_sliderValue.round());
              widget.changeStage(1);
            },
            child: Stack(
              children: <Widget>[button, slider],
            )));
  }
}
