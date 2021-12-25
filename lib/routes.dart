import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:smart_cashier/screens/barcode/components/barcodeScanner.dart';
import 'package:smart_cashier/screens/cart/cart_screen.dart';
import 'package:smart_cashier/screens/comments/commentsAll.dart';
import 'package:smart_cashier/screens/comments/rateAll.dart';
import 'package:smart_cashier/screens/complete_order/components/compleate_order.dart';
import 'package:smart_cashier/screens/complete_profile/complete_profile_screen.dart';
import 'package:smart_cashier/screens/forgot_password/forgot_password_screen.dart';
import 'package:smart_cashier/screens/helpcenter/helpcenter_screen.dart';

import 'package:smart_cashier/screens/main/main_screens.dart';
import 'package:smart_cashier/screens/otp/otp_screen.dart';
// import 'package:smart_cashier/screens/profile/profile_screen.dart';
import 'package:smart_cashier/screens/sign_in/sign_in_screen.dart';
import 'package:smart_cashier/screens/splash/splash_screen.dart';
import 'package:smart_cashier/screens/barcode/barcode_Screen.dart';

import 'screens/barcode/barcode_Screen.dart';
import 'screens/comments/rate.dart';
import 'screens/search/search_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'package:smart_cashier/screens/home_ahmed/home_screen_ahmed.dart';
const String splashScreen="/splashScreen";
const String signInScreen="/signInScreen";
const String mainScreenState="/mainScreenState";
const String forgotPasswordScreen="/forgotPasswordScreen";
const String loginSuccessScreen ="/loginSuccessScreen";
const String signUpScreen ="/signUpScreen";
const String completeProfileScreen ="/completeProfileScreen";
const String otpScreen ="/otpScreen";
const String homeScreen ="/homeScreen";
const String profileScreen ="/profileScreen";
const String barcodeScanner ="/barcodeScanner";
const String cartScreen="/cart";
const String homeScrrenAhmed="/homeScrrenAhmed";
const String completeOrder="/completeOrder";
const String searchBarDemoApp="/searchBarDemoApp";
const String searchBarDemoHome="/searchBarDemoHome";
const String rate="/rate";
const String allRate="/allRate";
const String commentsAll="/commentsAll";
const String helpCenter="/helpCenter";
class CustomRoutr{
  static Route<dynamic> generatedRoute(RouteSettings settings){
    switch(settings.name){
      case splashScreen:
       return MaterialPageRoute(builder: (_)=>SplashScreen());
      case signInScreen:
       return MaterialPageRoute(builder: (_)=>SignInScreen());
      case forgotPasswordScreen:
       return MaterialPageRoute(builder: (_)=>ForgotPasswordScreen());
   
      case signUpScreen:
       return MaterialPageRoute(builder: (_)=>SignUpScreen());
      case completeProfileScreen:
       return MaterialPageRoute(builder: (_)=>CompleteProfileScreen());
      case otpScreen:
       return MaterialPageRoute(builder: (_)=>OtpScreen());
   
      case barcodeScanner:
       return MaterialPageRoute(builder: (_)=>BarcodeScanner1());
      case cartScreen:
       return MaterialPageRoute(builder: (_)=>CartScreen());
      case homeScrrenAhmed:
       return MaterialPageRoute(builder: (_)=>HomeScreenAhmed());
      case mainScreenState:
       return MaterialPageRoute(builder: (_)=>MainScreen());
       case completeOrder:
       return MaterialPageRoute(builder: (_)=>CompleteOrder());
     
       case searchBarDemoHome:
       return MaterialPageRoute(builder: (_)=>SearchBarDemoHome());
       case rate:
       return MaterialPageRoute(builder: (_)=>RateApp());
       case allRate:
       return MaterialPageRoute(builder: (_)=>RateAll());
       case commentsAll:
       return MaterialPageRoute(builder: (_)=>CommentsAll());
       case helpCenter:
       return MaterialPageRoute(builder: (_)=>HelpCenter());
    }
  }
}
