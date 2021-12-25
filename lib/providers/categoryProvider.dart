
import 'package:flutter/cupertino.dart';
import 'package:smart_cashier/models/category.dart';

class CategoryProvider extends ChangeNotifier{

  bool Load=true;
bool hasError=false;

List<Category> category=[];

void changeCategoryState(List<dynamic> data) async{
  category.clear();
data.forEach((element) {
  category.add(Category.fromJson(element));
});
  notifyListeners();

}
addError(){
  hasError=true;
  notifyListeners();
}


}