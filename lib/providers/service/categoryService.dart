import 'package:smart_cashier/api/Api.dart';
import 'package:smart_cashier/api/ResponseData.dart';
import 'package:smart_cashier/providers/categoryProvider.dart';
import 'package:smart_cashier/api/Api.dart';
class CategoryService{
  CategoryProvider categoryProvider;
  CategoryService(this.categoryProvider);

  Future<void> getCategory()async{
ResponseData responseData;
 responseData=await Api.apiGet(subUrl: 'catagory.php');

 if (responseData.error&& responseData.timeout) {
   categoryProvider.addError();
   
 } else {
    if (responseData.data != 'NoData') {
      categoryProvider.changeCategoryState(responseData.data);
    }else{
        categoryProvider.addError();
    }
 }


  }
}