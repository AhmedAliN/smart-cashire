import 'package:smart_cashier/models/products.dart';

class Cart {
  String id;
  String userId;
  String productId;
  String qty;
  String price;
  String cashId;
  String orderId;
  Products products;

  Cart(
      {this.id,
      this.userId,
      this.productId,
      this.qty,
      this.products,
      this.price,
      this.cashId,
      this.orderId});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
     userId= json['userId'];
     productId = json['productId'];
    qty = json['qty'];
    price = json['price'];
    cashId = json['cashId'];
     orderId= json['orderId'];
     products=json['products'][0]!=null? Products.fromJson(json['products'][0]):null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['productId'] = this. productId;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['cashId'] = this.cashId;
    data['orderId'] = this.orderId;
    return data;
  }
}
