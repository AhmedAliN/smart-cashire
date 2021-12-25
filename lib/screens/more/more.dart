import 'package:flutter/material.dart';
// import 'package:smart_cashier/components/coustom_bottom_nav_bar.dart';
// import 'package:smart_cashier/enums.dart';

import 'components/body.dart';

class More extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(""),
      ),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
