import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_cashier/api/Api.dart';
import 'package:smart_cashier/api/ResponseData.dart';
import 'package:smart_cashier/components/custom_surfix_icon.dart';
import 'package:smart_cashier/components/default_button.dart';
import 'package:smart_cashier/components/form_error.dart';
import 'package:smart_cashier/data_variables/Data_Storage.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/models/user.dart';
import 'package:smart_cashier/routes.dart';
import 'package:smart_cashier/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "التالي",
            press: () async {
              if (_formKey.currentState.validate()) {
                   _formKey.currentState.save();
            
                
                var data = {
                  'email': user.email.toString(),
                  'password':user.password.toString(),
                  'firstName':firstName,
                  'lastName':lastName,
                  'phone':"967$phoneNumber",
                  
                };
                ResponseData responseData =
                    await Api.apiPost(subUrl: "register.php", body: (data));
                if (responseData.error && responseData.timeout) {
                  print('Error');
                  print(responseData.data);
                } else {
                  if (responseData.data != 'Error') {
                    print(responseData.data.length);
                    // User user = User.fromJson(responseData.data);
                    // print(user.toJson());
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
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      textDirection: TextDirection.rtl,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "العنوان",
        hintText: "ادخل عنوان جوالك",
        hintTextDirection: TextDirection.rtl,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      textDirection: TextDirection.rtl,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "رقم الجوال",
        hintText: "ادخل رقم جوالك",
        hintTextDirection: TextDirection.rtl,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      textDirection: TextDirection.rtl,
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "الكنية",
        hintText: "ادخل كنيتك (لقبك)",
        hintTextDirection: TextDirection.rtl,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      textDirection: TextDirection.rtl,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "الاسم الأول",
        hintText: "ادخل اسمك الأول",
        hintTextDirection: TextDirection.rtl,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
