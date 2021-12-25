import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_cashier/api/Api.dart';
import 'package:smart_cashier/api/ResponseData.dart';
import 'package:smart_cashier/components/custom_surfix_icon.dart';
import 'package:smart_cashier/components/form_error.dart';
import 'package:smart_cashier/data_variables/Data_Storage.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/helper/keyboard.dart';
// import 'package:smart_cashier/models/products.dart';
import 'package:smart_cashier/models/user.dart';
import 'package:smart_cashier/screens/forgot_password/forgot_password_screen.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../routes.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(5)),
          DefaultButton(
            text: " دخول",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print('ahmmed');
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                var data = {
                  'email': email.toString(),
                  'password': password,
                };
                ResponseData responseData =
                    await Api.apiPost(subUrl: "login.php", body: (data));
                if (responseData.error && responseData.timeout) {
                  print('Error');
                  print(responseData.data);
                } else {
                  if (responseData.data != 'exist') {
                    print(responseData.data.length);
                    // User user = User.fromJson(responseData.data);
                    print(user.toJson());
                    user = new User.fromJson(
                                              responseData.data);
                                          DataStorage.setString(
                                              DataStorage.idKey,
                                              jsonEncode(user.toJson()));
                                          DataStorage.setbool(
                                              DataStorage.loginKey, true);
                                      

                                              Navigator.pushNamedAndRemoveUntil(context, mainScreenState, (Route<dynamic> route) => false);

               
                    
                  } else {
                    print(responseData.data);
                  }
                }
              }
            },
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("تذكرني"),
              Spacer(),
              GestureDetector(
                onTap: ()
                {
                        Navigator.pushNamed(context, forgotPasswordScreen);
                },
                child: Text(
                  "نسيت كلمة السر؟",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      textDirection: TextDirection.rtl,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "كلمة السر",
        hintTextDirection: TextDirection.rtl,
        hintText: "ادخل كلمة السر",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      textDirection: TextDirection.rtl,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Email",
        hintTextDirection: TextDirection.rtl,
        hintText: "ادخل بريدك الإلكتروني(الإيميل)",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
