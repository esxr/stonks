import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int _counter = 0;

  bool _buttonPressed = false;
  bool _loopActive = false;

  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      setState(() {
        _counter++;
      });

      // wait a bit
      await Future.delayed(Duration(milliseconds: 200));
    }

    _loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Listener(
          onPointerDown: (details) {
            _buttonPressed = true;
            _increaseCounterWhilePressed();
          },
          onPointerUp: (details) {
            _buttonPressed = false;
          },
          child: Container(
            decoration:
                BoxDecoration(color: Colors.orange, border: Border.all()),
            padding: EdgeInsets.all(16.0),
            child: Text('Value: $_counter'),
          ),
        ),
      ),
    );
  }
}
