
import 'package:flutter/cupertino.dart';
import 'package:smart_cashier/models/category.dart';
import 'package:smart_cashier/models/products.dart';

class ProductProvider extends ChangeNotifier{

  bool Load=true;
bool hasError=false;

List<Products> products=[];

void changeProductsState(List<dynamic> data) async{
  products.clear();
data.forEach((element) {
  products.add(Products.fromJson(element));
});
Load=false;
  notifyListeners();

}
addError(){
  Load=false;
  hasError=true;
  notifyListeners();
}

addLoad(){
  Load=true;
  notifyListeners();
}
reset(){
  Load=true;
  hasError=false;
  products.clear();
  notifyListeners();
}


}