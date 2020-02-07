import 'package:flutter/material.dart';
import 'package:stonks/money.dart';

class Confirmation extends StatefulWidget {
  final int balance; // balance received from previous stage
  final Function(int) changeStage;

  Confirmation({this.balance, this.changeStage});

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  TextEditingController _controller = TextEditingController();

  String _controllerValue;
  double amountFontSize = 64;
  double reasonFontSize = 15;
  double _radius = 10;

  void debugBalance() async {
    // DEBUG
    double _balance = await getBalance();
    print("Balance: " + _balance.toString());
    // END DEBUG
  }

  void deductBalance() async {
    try {
      spendAmount(double.parse(_controllerValue));
      widget.changeStage(0);
    } catch (e) {
      // display a toast telling the user  to enter the  balance
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Please enter an amount!"),
        duration: Duration(seconds: 1),
      ));
    }

    // DEBUG
    debugBalance();
    print(_controllerValue.toString());
    // END DEBUG
  }

  void initState() {
    _controllerValue = widget.balance.toString();

    // controller state management
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
      _controllerValue = _controller.text.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  // Amount
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                        // remove hint text (preselected text)  on  tap
                        onTap: () {
                          setState(() {
                            _controllerValue = "";
                          });
                        },
                        onSubmitted: (value) {
                          deductBalance();
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: amountFontSize),
                        controller: _controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(_radius),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            hintText: _controllerValue)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Reason
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: reasonFontSize),
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(_radius),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            labelText: "What's this for ?")),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                          autofocus: true,
                          child: Text("Ok"),
                          onPressed: () {
                            deductBalance();
                          }),
                      FlatButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            debugBalance();
                            widget.changeStage(0);
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ]);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
}
