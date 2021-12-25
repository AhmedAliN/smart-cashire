import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {

  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text('معلوماتك الشخصية'),
        ),
        body: (
       
          
             Column(
               
              children: [
                     SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/logo/logo_E.png"),
          ),
        ],
      ),
    ),
                listItem(' الاسم', user.firstName+''+user.lastName),
                listItem(
                    ' البريد الإلكتروني', user.email),
                listItem('رقم الحساب', '12345'),
                listItem(
                    'المبلغ المتبقي في الحساب', '500'),
                
              ],
            )
          
       ));
  }

  Widget listItem(String a, String b) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.grey[100],
          //       borderRadius: BorderRadius.all(
          //           Radius.circular(18))),
          //   child: Icon(
          //     Icons.date_range,
          //     color: Colors.lightBlue[900],
          //   ),
          //   padding: EdgeInsets.all(12),
          // ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  a,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[900]),
                ),
                Text(
                  b,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}