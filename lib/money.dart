import 'package:shared_preferences/shared_preferences.dart';

addAmount(double amount) async {
  double newBalance = await getBalance() + amount;
  setBalance(newBalance);
}

spendAmount(double amount) async {
  double newBalance = await getBalance() - amount;
  if (newBalance >= 0) {
    setBalance(newBalance);
    return;
  }
  print("Balance not enough!");
}

// Double -> String
setBalance(double amount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('money', amount.toString());
}

// String -> Double
getBalance() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  double money = double.parse(prefs.getString('money'));
  return money;
}

removeBalance() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('money');
}


// TODO: add a function to upload transaction history to SERVER
