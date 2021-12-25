import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/components/default_button.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/providers/cartProvider.dart';
import 'package:smart_cashier/providers/service/cartService.dart';

import '../../../size_config.dart';

class CompleteOrder extends StatefulWidget {
  @override
  _CompleteOrderState createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder> {
  CartProvider cartProvider;
  CartService cartService;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of(context, listen: false);
    cartService = new CartService(cartProvider);
    cartService.getUserAcc({'user_id': user.id});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text('متابعة الطلب'),
        ),
        body: Consumer<CartProvider>(builder: (context, model, child) {
          if (model.load) {
            return Center(child: CircularProgressIndicator());
          } else if (model.hasError || model.accounts == null) {
            return Center(
              child: Text('noDAta'),
            );
          } else {
            return Column(
              children: [
                listItem('رقم الحساب', model.accounts.accId),
                listItem(
                    'المبلغ المتبقي في الحساب', model.accounts.totalAmount),
                listItem(
                  'قيمة الطلب',
                  model.cart
                      .fold(0,
                          (prv, element) => prv + double.parse(element.price))
                      .toStringAsFixed(2),
                ),
                  SizedBox(
                  width: getProportionateScreenWidth(190),
                  child:model.cart.length>0? DefaultButton(
                    text: "انهاء الطلب  ",
                    press: () async {
                         double order=double.parse( model.cart
                      .fold(0,
                          (prv, element) => prv + double.parse(element.price))
                      .toStringAsFixed(2));
                        print(order.toString());
                      if (order>double.parse(model.accounts.totalAmount)) {
                          print('bbbbbbbbb');
                       _showMaterialDialog();
                       print('bbbbbbbbb');
                        
                      } else {
                        String st= await cartService.addorder();
                        if (st=='ok') {
                          _showCupertinoDialog();
                        } else {
                        }
                      }
                      // Navigator.pushNamed(context, completeOrder);
                    },
                  ):SizedBox(),
                ),
              ],
            );
          }
        }));
  }

  Widget listItem(String a, String b) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.grey[100],
          //       borderRadius: BorderRadius.all(
          //           Radius.circular(18))),
          //   child: Icon(
          //     Icons.date_range,
          //     color: Colors.lightBlue[900],
          //   ),
          //   padding: EdgeInsets.all(12),
          // ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  a,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[900]),
                ),
                Text(
                  b,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('تحذير'),
            content: Text('رصيدك غير كافي '),
            actions: <Widget>[
          
              TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog();
                },
                child: Text('اغلاق'),
              )
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  void _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(' تم طلبك بنجاح'),
            content: Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog();
                },
                child: Text('HelloWorld!'),
              )
            ],
          );
        });
  }

  void _showSimpleDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Chosse an Option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Option 1'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Option 2'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Option 3'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Option 4'),
              ),
            ],
          );
        });
  }
}
