import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';

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
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Shjn Milkys Restaurant',
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#50b6bb"),
        primarySwatch: Colors.red,
        accentColor: Colors.indigo,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
