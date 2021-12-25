import 'package:flutter/material.dart';
import 'package:smart_cashier/constants.dart';
import 'package:smart_cashier/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("اكمل تسجيل بياناتك",
                    style: TextStyle(
                        color: Black_Color,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold)),
                // Text(
                //   "Complete your details or continue  \nwith social media",
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "لاستمرار في تأكيد موافقتك على انشاء حسابك",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
