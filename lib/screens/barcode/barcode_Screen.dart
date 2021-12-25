import 'package:flutter/material.dart';

import 'components/body.dart';

class BarcodeScanner1 extends StatelessWidget {
  static String routeName = "/barcode";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.message),
          //   color: Colors.grey,
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: new Image.asset('assets/logo/logo_E.png'),
          //   color: Colors.black54,
          //   onPressed: () {},
          // ),
        ],
        centerTitle: true,
        title: Text(
          "الباركود",
          textDirection: TextDirection.rtl,
        ),
      ),
      body: Body(),
    );
  }
}
