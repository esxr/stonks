import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stonks/components/balanceView.dart';
import 'package:stonks/mechanism.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          child: BalanceView()
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.70,
          child: Mechanism(),
        )
      ],
    ));
  }
}
