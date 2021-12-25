

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/providers/userProvider.dart';
import 'package:smart_cashier/routes.dart';
// import 'package:smart_cashier/screens/splash/splash_screen.dart';
import 'package:smart_cashier/theme.dart';

import 'providers/cartProvider.dart';
import 'providers/categoryProvider.dart';
import 'providers/commentProvider.dart';
import 'providers/productProvider.dart';
import 'providers/rateProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider()),
    ChangeNotifierProvider(create: (context)=>CategoryProvider()),
    ChangeNotifierProvider(create: (context)=>ProductProvider()),
    ChangeNotifierProvider(create: (context)=>CartProvider()),
    ChangeNotifierProvider(create: (context)=>CommentsProvider()),
    ChangeNotifierProvider(create: (context)=>RateProvider()),
    

  ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      localizationsDelegates: [
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
  ],
  locale: Locale("fa", "IR"),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute:splashScreen,
      // initialRoute:completeOrder,
    //  on  CustomRoutr.generatedRoute,
    onGenerateRoute: CustomRoutr.generatedRoute,
    
    );
  }
}
