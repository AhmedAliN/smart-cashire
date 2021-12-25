import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/components/default_button.dart';
import 'package:smart_cashier/providers/userProvider.dart';
import 'package:smart_cashier/screens/home/home_screen.dart';
import 'package:smart_cashier/size_config.dart';

import '../../../routes.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "تسجيل خروج من التطبيق يا احممد ",
            press: () {
              Provider.of<UserProvider>(context,listen: false).logout();
                  Navigator.pushNamedAndRemoveUntil(context, homeScreen, (Route<dynamic> route) => false);
              // Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
