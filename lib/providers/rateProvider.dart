
import 'package:flutter/cupertino.dart';
import 'package:smart_cashier/models/rate.dart';

class RateProvider extends ChangeNotifier{

  bool load=true;
bool hasError=false;

List<Rate> rate=[];

void changeRateState(List<dynamic> data) async{
  rate.clear();
data.forEach((element) {
  rate.add(Rate.fromJson(element));
});
load=false;
  notifyListeners();
}

addError(){
  hasError=true;
  notifyListeners();
}

reset(){
  rate.clear();
  load=true;
  hasError=false;
  notifyListeners();
}


}