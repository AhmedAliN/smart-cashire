import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/providers/productProvider.dart';
import 'package:smart_cashier/providers/service/productService.dart';

class SearchBarDemoHome extends StatefulWidget {
  @override
  _SearchBarDemoHomeState createState() => new _SearchBarDemoHomeState();
}

class _SearchBarDemoHomeState extends State<SearchBarDemoHome> {
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Search Bar Demo'),
        actions: [searchBar.getSearchAction(context)]);
  }

  Future<void> onSubmitted(String value) async {
    productProvider.reset();
  await  productService.getSearchProduct(value);
  }

  _SearchBarDemoHomeState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }

  ProductProvider productProvider;
  ProductService productService;
  @override
  void initState() {
    super.initState();

    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productService = new ProductService(productProvider);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Consumer<ProductProvider>(builder: (context, model, child) {
          if (model.Load) {
            return Center(child: CircularProgressIndicator());
          } else if (model.hasError || model.products.isEmpty) {
            return Center(
              child: Text('noDAta'),
            );
          } else {
            return
                // ListView.builder(
                //         padding: EdgeInsets.symmetric(horizontal: 10),
                //         scrollDirection: Axis.horizontal,
                GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: .5,
              ),
              itemCount: model.products.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  // width: 210.0,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 120.0,
                        child: Container(
                          height: 150.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  model.products[index].name,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  '${model.products[index].price} ريال',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  model.products[index].barcode,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  model.products[index].name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: model.products[index].name,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 150.0,
                                  width: 200.0,
                                  image:
                                      NetworkImage(model.products[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Positioned(
                            //   left: 10.0,
                            //   bottom: 10.0,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: <Widget>[
                            //       Text(
                            //         model.products[index].name,
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 20.0,
                            //           fontWeight: FontWeight.w600,
                            //           letterSpacing: 1,
                            //         ),
                            //       ),
                            //       Row(
                            //         children: <Widget>[
                            //           Icon(
                            //             Icons.category,
                            //             size: 10.0,
                            //             color: Colors.white,
                            //           ),
                            //           SizedBox(width: 5.0),
                            //           Text(
                            //             model.products[index].name,
                            //             style: TextStyle(
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
            // Center(child: Text(productProvider.products.length.toString()),);

          }
        }),
      ),
    );
  }
}
