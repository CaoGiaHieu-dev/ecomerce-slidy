import 'package:ecomerce/constaints/thems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
  {
    SystemChrome.setSystemUIOverlayStyle
    (
      SystemUiOverlayStyle
      (
        statusBarColor: kMainColor
      )
    );
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Shjn Milkys Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
