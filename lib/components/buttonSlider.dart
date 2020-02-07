import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
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

  // Define Slider Properties
  double sliderMin = 0;
  double sliderMax = 100;
  int sliderDivisions = 10;

  void sliderOnChangeEnd(value) {
    widget.changeBalance(value.round());
  }

  void sliderOnChanged(value) {
    setState(() {
      _sliderValue = value;
    });
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
      child: Container(
        child: RotatedBox(
          quarterTurns: 3,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              valueIndicatorColor: Color(0xFFFE9923),
              inactiveTrackColor: Color(0xFFFEDB41),
              activeTrackColor: Color(0xFFFFCC33),
              trackHeight: 3.0,
              thumbColor: Color(0xFFFE9923),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayColor: Colors.purple.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 50.0),
            ),
            child: Slider(
              label: _sliderValue.toString(),
              min: sliderMin,
              max: sliderMax,
              divisions: sliderDivisions,
              onChangeEnd: (value) {
                sliderOnChangeEnd(value);
              },
              onChanged: (value) {
                sliderOnChanged(value);
              },
              value: _sliderValue,
            ),
          ),
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
