import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        centerTitle: true,
        title: Text("اشتراك", textDirection: TextDirection.rtl),
      ),
      body: Body(),
    );
  }
}
