import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/providers/categoryProvider.dart';
import 'package:smart_cashier/providers/service/categoryService.dart';
// import 'package:smart_cashier/providers/userProvider.dart';
import 'package:smart_cashier/screens/cart/cart_screen.dart';
import 'package:smart_cashier/screens/comments/comments.dart';
// import 'package:smart_cashier/screens/comments/commentsAll.dart';
// import 'package:smart_cashier/screens/comments/rate.dart';
// import 'package:smart_cashier/screens/comments/rateAll.dart';
import 'package:smart_cashier/screens/home_ahmed/home_screen_ahmed.dart';
import 'package:smart_cashier/screens/more/more.dart';

// import '../../routes.dart';

// import '../../constants.dart';
const kTextColor = Color(0xFF535353);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[  
    HomeScreenAhmed(),
    CartScreen(),
    TestMe(),
    More(),
    
  ];
  CategoryProvider categoryProvider;
  CategoryService categoryService;
  
  @override
  void initState() {
    super.initState();
    categoryProvider=Provider.of<CategoryProvider>(context,listen: false);
    categoryService=new CategoryService(categoryProvider);
    categoryService.getCategory();
  }
  @override
  Widget build(BuildContext context) {
    // print('sfaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+user.firstName);
    return Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "الصفحة الرئيسية",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(FontAwesomeIcons.folderOpen),
            //   label: "عرض حقيقي",
            // ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                // By default our  icon color is white
                color: kTextColor,
              ),
              label: "عربة",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rate_review_outlined),
              label: "اقتراحك ",
            ),
           
            BottomNavigationBarItem(
              icon: Icon(Icons.more_outlined),
              label: "المزيد",
            ),
            
          ],
        ));
  }
}

