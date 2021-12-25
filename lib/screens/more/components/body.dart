import 'package:flutter/material.dart';
import '../../../routes.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "تقيمك للتطبيق",
            icon: "assets/icons/Heart Icon.svg",
            press: () {
              Navigator.pushNamed(context, rate);
            },
          ),
          ProfileMenu(
            text: "كل التقيمات",
            icon: "assets/icons/Heart Icon_2.svg",
            press: () {
                Navigator.pushNamed(context, allRate);
            },
          ),
          ProfileMenu(
            text: "كل الاقتراحات",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.pushNamed(context, commentsAll);
            },
          ),
          ProfileMenu(
            text: "مركز المساعدة",
            icon: "assets/icons/Question mark.svg",
            press: () {
                    Navigator.pushNamed(context, helpCenter);
            },
          ),
          ProfileMenu(
            text: "تسجيل الخروج",
            icon: "assets/icons/Log out.svg",
          
            press: () {
              Navigator.pushNamed(context, signInScreen);
            },
          ),
        ],
      ),
    );
  }
}
