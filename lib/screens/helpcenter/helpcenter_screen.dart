import 'package:flutter/material.dart';
import 'body.dart';

class HelpCenter extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("نطمح لمساعدتك",textDirection: TextDirection.ltr,),
        
      ),
      body: Body(),
    );
  }
}
