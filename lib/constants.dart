import 'package:flutter/material.dart';
import 'package:smart_cashier/size_config.dart';
const Red_Color=Color(0xFFFF0000);
const Black_Color=Color(0xFF000000);
const kPrimaryColor = Color(0xFFC0C0C0);
const Gold_color= Color(0xFFFFD700);

const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFC0C0C0)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "لطفا ادخل بريدك الإلكتروني";
const String kInvalidEmailError = "الرجاء ادخال بريد إلكتروني صحيح";
const String kPassNullError = "لطفا ادخل كلمة المرور خاصتك";
const String kShortPassError = "كلمة المرور غير مقبولة نظرا لضعف امنيتها";
const String kMatchPassError = "كلمة المرور غير مطابقة";
const String kNamelNullError = "لطفا ادخل اسمك";
const String kPhoneNumberNullError = "لطفا ادخل رقم جوالك";
const String kAddressNullError = "لطفا ادخل عنوانك";
const String kPassPINError = "لطفا ادخل كلمة المرور الاحتياطية (PIN)";
const String kPINPassError = "كلمة المرور الاحتياطية غير مطابقة";
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
