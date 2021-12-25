import 'package:smart_cashier/api/Api.dart';
import 'package:smart_cashier/api/ResponseData.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/models/cart.dart';
import 'package:smart_cashier/providers/categoryProvider.dart';
import 'package:smart_cashier/api/Api.dart';

import '../cartProvider.dart';

class CartService {
  CartProvider cartProvider;
  CartService(this.cartProvider);

  Future<void> getCart() async {
    ResponseData responseData;
    var data={
      'user_id':user.id.toString(),
    };
    responseData = await Api.apiPost(subUrl: 'card.php',body:data);

    if (responseData.error && responseData.timeout) {
      cartProvider.addError();
    } else {
      if (responseData.data != 'NoData') {
        cartProvider.changeCartState(responseData.data);
      } else {
        cartProvider.addError();
      }
    }
  }
  Future<String> addorder() async {
    String dd='Error';
    ResponseData responseData;
    var data={
      'user_id':user.id.toString(),
    };
    responseData = await Api.apiPost(subUrl: 'order.php',body:data);

    if (responseData.error && responseData.timeout) {
      cartProvider.addError();
    } else {
      if (responseData.data != 'NoData') {
        cartProvider.reset();
         cartProvider.changeAccountsState(responseData.data);
        dd='ok';
      } else {
        cartProvider.addError();
      }
    }
    return dd;
  }

  Future<void> getUserAcc(var data) async {
    ResponseData responseData;
 cartProvider.setload();
   
    responseData = await Api.apiPost(subUrl: 'userAccounts.php',body:data);
    if (responseData.error && responseData.timeout) {
      cartProvider.addError();
    } else {
      if (responseData.data != 'NoData') {
        cartProvider.changeAccountsState(responseData.data);
      } else {
        cartProvider.addError();
      }
    }
    
  }
  Future<String> addCart(var data) async {
    String res='Error';
    ResponseData responseData;
    responseData = await Api.apiPost(subUrl: 'barcodeProducts.php',body: data);
         print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh-'+responseData.data);
    if (responseData.error && responseData.timeout) {
      cartProvider.addError();
    } else {
      if (responseData.data != 'NoData') {
        res=responseData.data;
        // cartProvider.changeCartState(responseData.data);
      } else {
         res='No Product';
        cartProvider.addError();
      }
    }
    return res;
  }

  Future<String> removeCart(Cart data1) async {
    String res='Error';
        var data={
                      'cart_id':data1.id.toString(),
                    };
    ResponseData responseData;
    responseData = await Api.apiPost(subUrl: 'removecart.php',body: data);
      
    if (responseData.error && responseData.timeout) {
      cartProvider.addError();
    } else {
      if (responseData.data != 'NoData') {
        res=responseData.data;
        cartProvider.removeCart(data1);
      } else {
         res='No Product';
        cartProvider.addError();
      }
    }
    return res;
  }
}
