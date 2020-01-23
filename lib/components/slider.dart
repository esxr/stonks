import 'package:flutter/material.dart';

class MoneySlider extends StatefulWidget {

  final Function(int, int) changeStage;
  MoneySlider({this.changeStage});

  @override
  _MoneySliderState createState() => _MoneySliderState();
}

class _MoneySliderState extends State<MoneySlider> {

  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        activeColor: Colors.indigoAccent,
        min: 0.0,
        max: 100,
        divisions: 10,

        onChangeEnd: (value) {
          // close the slider and call stage 2 widget
          widget.changeStage(value.toInt(), 2);
          print(value);
        },

        onChanged: (value) {
          // change slider appearance
          setState(() {
            _sliderValue = value;
          });
        },

        value: _sliderValue,
      ),
    );
  }
}
