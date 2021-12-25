import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/constants.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/providers/userProvider.dart';
import 'package:smart_cashier/routes.dart';
import 'package:smart_cashier/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": " ", "image": "assets/logo/SC.jpg"},
    {
      "text": "!مرحبا بك في تطبيق الحاسب الذكي، دعنا نتسوق",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "  نساعدك في التعامل مع المراكز الضخمة عبر جوالك   \nفي اليمن",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "نمنحك أبسط طريقة للتسوق \nكل ما عليك فعله أن تستخدم تطبيقنا",
      "image": "assets/images/splash_3.png"
    },
    {
      "text": " خدمة الباركود \nتبسط عملية التسويق",
      "image": "assets/images/2.png"
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context,listen: false).checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "...استمر",
                      press: () {
                        
                        if (isLogin) {
                        Navigator.pushNamed(context, mainScreenState);
                        //  Navigator.pushNamed(context, helpCenter);
                          
                        } else {
                        Navigator.pushNamed(context, signInScreen);
                        }
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
