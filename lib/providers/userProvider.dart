
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:smart_cashier/data_variables/Data_Storage.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/models/user.dart';

class UserProvider extends ChangeNotifier{
bool Load=true;
bool hasError=true;

Future<void> checkLogin() async{
  isLogin =await DataStorage.getbool(DataStorage.loginKey);
  if (isLogin) {
    var data=(await DataStorage.getString(DataStorage.idKey));
    data=jsonDecode(data);
    user =new User.fromJson(data);
    
  } else {
    user.id='-1';

    DataStorage.setString(DataStorage.idKey,"");
    user=new User();
  }
  hasError=false;
  notifyListeners();

}
 Future <void> logout(){
    DataStorage.setString(DataStorage.idKey,"");
    user=new User();
     user.id='-1';
    notifyListeners();
 }

}