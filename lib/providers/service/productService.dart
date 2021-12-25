import 'package:smart_cashier/api/Api.dart';
import 'package:smart_cashier/api/ResponseData.dart';
import 'package:smart_cashier/providers/categoryProvider.dart';
import 'package:smart_cashier/api/Api.dart';

import '../productProvider.dart';

class ProductService {
  ProductProvider productProvider;
  ProductService(this.productProvider);

  Future<void> getCategoryProduct(String id) async {
    ResponseData responseData;
    var data = {
      'catid': id.toString(),
    };
    productProvider.addLoad();

    responseData = await Api.apiPost(subUrl: 'catogryproducts.php', body: data);

    if (responseData.error && responseData.timeout) {
      productProvider.addError();
    } else {
      if (responseData.data != 'NoData') {
        productProvider.changeProductsState(responseData.data);
      } else {
        productProvider.addError();
      }
    }
  }
  Future<void> getSearchProduct(String id) async {
    ResponseData responseData;
    var data = {
      'name': id.toString(),
    };
    productProvider.addLoad();
    responseData = await Api.apiPost(subUrl: 'searchproducts.php', body: data);
    if (responseData.error && responseData.timeout) {
      productProvider.addError();
    } else {
      if (responseData.data != 'NoData') {
        productProvider.changeProductsState(responseData.data);
      } else {
        productProvider.addError();
      }
    }
  }
}
