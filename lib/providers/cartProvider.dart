import 'package:flutter/cupertino.dart';
import 'package:smart_cashier/models/accounts.dart';
import 'package:smart_cashier/models/cart.dart';

class CartProvider extends ChangeNotifier {
  bool load = true;
  bool hasError = false;
  List<Cart> cart = [];
  Accounts accounts;
  setload(){
    load=true;
    notifyListeners();
  }
  reset() {
    cart.clear();
    load = true;
    hasError = false;
    notifyListeners();
  }

  void changeCartState(List<dynamic> data) async {
    cart.clear();
    data.forEach((element) {
      cart.add(Cart.fromJson(element));
    });
    load = false;
    notifyListeners();
  }

  void changeAccountsState(dynamic data) async {
    accounts = Accounts.fromJson(data);
    load = false;
    notifyListeners();
  }

  removeCart(Cart cart1) {
    cart.remove(cart1);

    notifyListeners();
  }

  addError() {
    load = false;
    hasError = true;
    notifyListeners();
  }
}
