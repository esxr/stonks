import 'package:flutter/material.dart';
import 'package:stonks/components/buttonSlider.dart';
import 'package:stonks/mechanism.dart';
import 'package:stonks/money.dart';
import 'components/button.dart';

import 'dart:developer';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LOL',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Container(
            child: Mechanism()
          ),
        ));
  }
}
