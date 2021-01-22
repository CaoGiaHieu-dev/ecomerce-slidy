import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
  {
    // SystemChrome.setSystemUIOverlayStyle
    // (
    //   SystemUiOverlayStyle
    //   (
    //     statusBarColor: kMainColor
    //   )
    // );
    return MultiProvider
    (
      providers: 
      [
        Provider<CartController>(create: (_) => CartController()),
      ],
      child: MaterialApp(
        navigatorKey: Modular.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Shjn Milkys Restaurant',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white38,
          primarySwatch: Colors.red,
          accentColor: Colors.indigo,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
