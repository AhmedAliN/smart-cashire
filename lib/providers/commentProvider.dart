
import 'package:flutter/cupertino.dart';
import 'package:smart_cashier/models/category.dart';
import 'package:smart_cashier/models/comments.dart';

class CommentsProvider extends ChangeNotifier{

  bool load=true;
bool hasError=false;

List<Comments> comments=[];

void changeCommentsState(List<dynamic> data) async{
  comments.clear();
data.forEach((element) {
  comments.add(Comments.fromJson(element));
});
load=false;
  notifyListeners();
}

addError(){
  hasError=true;
  notifyListeners();
}

reset(){
  comments.clear();
  load=true;
  hasError=false;
  notifyListeners();
}


}