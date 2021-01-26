
import 'package:ecomerce/app/app_widget.dart';
import 'package:ecomerce/app/modules/bottom_navigation/bottom_navigation_controller.dart';
import 'package:ecomerce/app/modules/bottom_navigation/bottom_navigation_module.dart';
import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:ecomerce/app/modules/cart/cart_module.dart';
import 'package:ecomerce/app/modules/check_out/check_out_controller.dart';
import 'package:ecomerce/app/modules/check_out/check_out_module.dart';
import 'package:ecomerce/app/modules/detail/detail_controller.dart';
import 'package:ecomerce/app/modules/detail/detail_module.dart';
import 'package:ecomerce/app/modules/home/home_controller.dart';
import 'package:ecomerce/app/modules/home/home_module.dart';
import 'package:ecomerce/app/modules/product_in_category/product_in_category_controller.dart';
import 'package:ecomerce/app/modules/product_in_category/product_in_category_module.dart';
import 'package:ecomerce/app/modules/profile/profile_controller.dart';
import 'package:ecomerce/app/modules/profile/profile_module.dart';
import 'package:ecomerce/app/repositories/cart_repository.dart';
import 'package:ecomerce/app/repositories/product_repository.dart';
import 'package:ecomerce/app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppModule extends MainModule {
  @override
  List<Bind> get binds =>  
  [
        Bind((i) => BottomNavigationController()),
        Bind((i) => DetailController()),
        Bind((i) => ProfileController(i.get<UserRepository>())),
        Bind((i) => HomeController()),
        Bind( (i) =>ProductInCategoryController(i.get<ProductRepository>(),Modular.args.data )),
        Bind( (i)=> CartController()),
        Bind( (i)=> CheckOutController(i.get<CartRepository>())),
  ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: BottomNavigationModule()),
        ModularRouter("/home" , module: HomeModule()),
        ModularRouter("/detail", module: DetailModule()),
        ModularRouter("/category/:name", module: ProductInCategoryModule()),
        ModularRouter("/cart" , module: CartModule()),
        ModularRouter("/profile" , module: ProfileModule()),
        ModularRouter("/checkout" , module: CheckOutModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
