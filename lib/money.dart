import 'package:shared_preferences/shared_preferences.dart';

addAmount(String amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int newBalance = int.parse(await getBalance()) + int.parse(amount);
  prefs.setString('money', newBalance.toString());
}

spendAmount(String amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int newBalance = int.parse(await getBalance()) - int.parse(amount);
  if (newBalance >= 0) {
    prefs.setString('money', newBalance.toString()); return;
  }
  print("Balance not enough!");
}

setBalance(String amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('money', amount);
}

getBalance() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String money = prefs.getString('money');
  return money;
}

removeBalance() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.remove('money');
}

// TODO: add a function to upload transaction history to SERVER
