import 'package:flutter/material.dart';
import 'package:smart_cashier/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../routes.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "إنشاء حساب جديد   ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, signUpScreen),
          child: Text(
            "تسجيل",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Red_Color),
          ),
        ),
      ],
    );
  }
}
