import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/providers/categoryProvider.dart';
import 'package:smart_cashier/providers/service/categoryService.dart';

import '../productCategory.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../../../constants.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

class BlogHomeOnePage extends StatefulWidget {
  @override
  _BlogHomeOnePageState createState() => _BlogHomeOnePageState();
}

class _BlogHomeOnePageState extends State<BlogHomeOnePage> {
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
    return Consumer<CategoryProvider>(builder: (context, model, child) {
     return DefaultTabController(
        initialIndex: 0,
        length: model.category.length,
        child: Theme(
          data: ThemeData(
            primaryColor: primaryColor,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              textTheme: TextTheme(
                title: TextStyle(
                  color: secondaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconTheme: IconThemeData(color: secondaryColor),
              actionsIconTheme: IconThemeData(
                color: secondaryColor,
              ),
            ),
          ),
          child: Scaffold(
            backgroundColor: Theme.of(context).buttonColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text('Smart Cashier'),
              
              actions: <Widget>[
                // IconButton(
                //   icon: Icon(Icons.search),
                //   onPressed: () {},
                // )
              ],
              bottom: TabBar(
                isScrollable: true,
                labelColor: primaryColor,
                indicatorColor: primaryColor,
                unselectedLabelColor: secondaryColor,
                tabs:
                // <Widget>[
                  model.category.map((e){
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.name),
                  );
                   } ).toList(),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الكل"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("المأكولات"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text(" المشروبات"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الملابس"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الاجهزة الإلكترونية والاستهلاكية"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الرياضة والترفيه"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الآلات"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الجمال والعناية الشخصية"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الأثاث"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الساعات والجوهرات والنظارات"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("ألعاب وهوايات"),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text("الرياضة والترفيه"),
                //   ),
                // ],
              ),
            ),
            body: TabBarView(
              children: model.category.map((e){
                  return  CategoryProduct(e.id);
                   } ).toList(),
              //  <Widget>[
              //   Container(
              //     child: Text("Tab 1"),
              //   ),
              //   Container(
              //     child: Text("Tab 2"),
              //   ),
              //   Container(
              //     child: Text("Tab 3"),
              //   ),
              //   Container(
              //     child: Text("Tab 4"),
              //   ),
              //   Container(
              //     child: Text("Tab 5"),
              //   ),
              //   Container(
              //     child: Text("Tab 6"),
              //   ),
              //   Container(
              //     child: Text("Tab 7"),
              //   ),
              //   Container(
              //     child: Text("Tab 8"),
              //   ),
              //   Container(
              //     child: Text("Tab 9"),
              //   ),
              //   Container(
              //     child: Text("Tab 10"),
              //   ),
              //   Container(
              //     child: Text("Tab 11"),
              //   ),
              //   Container(
              //     child: Text("Tab 12"),
              //   ),
              // ],
            ),
          ),
        ),
      
    );}
    );
  }
}
