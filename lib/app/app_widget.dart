import 'package:ecomerce/app/modules/bottom_navigation/bottom_navigation_controller.dart';
import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:ecomerce/app/modules/components/google_map_picker/google_map_picker_controller.dart';
import 'package:ecomerce/app/modules/history/history_controller.dart';
import 'package:ecomerce/app/modules/profile/profile_controller.dart';
import 'package:ecomerce/app/repositories/cart_repository.dart';
import 'package:ecomerce/app/repositories/user_repository.dart';
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
        Provider<HistoryController>(create: (_) => HistoryController(Modular.get<CartRepository>())),
        Provider<CartController>(create: (_) => CartController()),
        Provider<GoogleMapPickerController>(create: (_) => GoogleMapPickerController()),
        Provider<BottomNavigationController>(create: (_) => BottomNavigationController()),
        Provider<ProfileController>(create: (_) => ProfileController(Modular.get<UserRepository>())),
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
