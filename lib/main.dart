import 'package:flutter/material.dart';
import 'package:stonks/components/balanceView.dart';
import 'package:stonks/homePage.dart';
import 'package:stonks/mechanism.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Stonks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SingleChildScrollView(
                      child: Container(
                child: HomePage()
            ),
          )),
        );
  }
}
