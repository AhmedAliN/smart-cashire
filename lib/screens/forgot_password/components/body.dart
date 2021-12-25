import 'package:flutter/material.dart';
import 'package:smart_cashier/components/custom_surfix_icon.dart';
import 'package:smart_cashier/components/default_button.dart';
import 'package:smart_cashier/components/form_error.dart';
import 'package:smart_cashier/components/no_account_text.dart';
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
                "نسيت كلمة المرور",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "الرجاء ادخال بريدك الإلكتروني وسنرسل لك \n رابط لتستعيد حسابك",
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
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String pinpassword;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.emailAddress,
            // onSaved: (newValue) => email = newValue,
            // onChanged: (value) {
            //   if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            //     setState(() {
            //       errors.remove(kEmailNullError);
            //     });
            //   } else if (emailValidatorRegExp.hasMatch(value) &&
            //       errors.contains(kInvalidEmailError)) {
            //     setState(() {
            //       errors.remove(kInvalidEmailError);
            //     });
            //   }
            //   return null;
            // },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kPassPINError)) {
                setState(() {
                  errors.add(kPassPINError);
                });
              
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "الرمز الاحتياطي(PIN)",
              hintText: "ادخل كلمة السر الاحتياطية",
              hintTextDirection: TextDirection.rtl,
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                // Do wh
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
