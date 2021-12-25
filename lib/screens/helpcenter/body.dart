import 'package:flutter/material.dart';
// import 'package:smart_cashier/components/custom_surfix_icon.dart';
// import 'package:smart_cashier/components/default_button.dart';
// import 'package:smart_cashier/components/form_error.dart';
// import 'package:smart_cashier/components/no_account_text.dart';
import 'package:smart_cashier/size_config.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "  ارسل المشكلة التي واجهتك",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "  الرجاء ارسال استفسارك للبريد الالكتروني   \n وسنرد عليك في اقرب وقت  ",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  TextEditingController _controller = new TextEditingController();
  bool _enabled = false;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'SmartCashier2021@gmail.com',
        style: TextStyle(
          backgroundColor: kPrimaryColor,
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold
          
          
        ),
      

      )
    ]);
  }
}
          
          
