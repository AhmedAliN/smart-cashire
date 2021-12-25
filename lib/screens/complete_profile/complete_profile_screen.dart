import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
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
        title: Text('اشتراك'),
      ),
      body: Body(),
    );
  }
}
