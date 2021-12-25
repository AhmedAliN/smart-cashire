import 'package:flutter/material.dart';
import 'package:smart_cashier/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            color: Colors.grey,
            onPressed: () {},
          ),
          IconButton(
            icon: new Image.asset('assets/logo/logo_E.png'),
            color: Colors.black54,
            onPressed: () {},
          ),
        ],
        title: Text("رمز التحقق"),
      ),
      body: Body(),
    );
  }
}
