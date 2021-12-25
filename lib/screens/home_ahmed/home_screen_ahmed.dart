import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:smart_cashier/routes.dart';
import 'components/bloghomeone.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kDefaultPaddin = 20.0;

bool typing = false;

class HomeScreenAhmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/icons/SC_E.png'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, searchBarDemoHome);
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/barcode.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, barcodeScanner);
            },
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: BlogHomeOnePage(),
    );
  }
}
