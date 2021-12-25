import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/providers/cartProvider.dart';
import 'package:smart_cashier/providers/service/cartService.dart';
import 'package:smart_cashier/routes.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '/../../components/default_button.dart';

class BarcodeScenner extends StatefulWidget {
  @override
  _BarcodeScennerState createState() => _BarcodeScennerState();
}

class _BarcodeScennerState extends State<BarcodeScenner> {
  final _formKey = GlobalKey<FormState>();
  String _scanBarcode = 'Unknown';
  CartProvider cartProvider;
  CartService cartService;
  

  @override
  void initState() {
    super.initState();
    cartProvider=Provider.of<CartProvider>(context,listen: false);
    cartService=new CartService(cartProvider);
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    String data1;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      var data={
        'barcode':barcodeScanner,
        'user_id':user.id,
      };
     data1=await  cartService.addCart(data);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = data1;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    String data1;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
           var data={
        'barcode':barcodeScanRes,
        'user_id':user.id.toString(),
      };
     data1=await  cartService.addCart(data);

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = data1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(height: getProportionateScreenHeight(5)),
          DefaultButton(
            text: " ابدأ مسح الرمز الشريطي",
            press: () => scanBarcodeNormal(),
          ),
          Text('\n$_scanBarcode :نتيجة المسح', style: TextStyle(fontSize: 20))
        ]));
  }
}
