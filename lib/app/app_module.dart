
import 'package:ecomerce/app/modules/bottom_navigation/bottom_navigation_controller.dart';
import 'package:ecomerce/app/modules/bottom_navigation/bottom_navigation_module.dart';
import 'package:ecomerce/app/modules/detail/detail_controller.dart';
import 'package:ecomerce/app/modules/detail/detail_module.dart';
import 'package:ecomerce/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce/app/app_widget.dart';
import 'package:ecomerce/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds =>  [
        Bind((i) => BottomNavigationController()),
        Bind((i) => DetailController()),
        // Bind((i) => AppModule()),
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: BottomNavigationModule()),
        ModularRouter("/home" , module: HomeModule()),
        ModularRouter("/detail", module: DetailModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
