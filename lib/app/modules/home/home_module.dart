import 'package:dio/dio.dart';
import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:ecomerce/app/modules/components/header/header_controller.dart';
import 'package:ecomerce/app/modules/home/widgets/hot_items/hot_items_controller.dart';
import 'package:ecomerce/app/repositories/category_repository.dart';
import 'package:ecomerce/app/repositories/product_repository.dart';

import '../../repositories/category_repository.dart';
import 'widgets/category/category_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i)=> HeaderController() ),
    Bind((i) =>CartController()),
    Bind((i) => CategoryController( i.get<CategoryRepository>() )),
    Bind( (i) => HotItemsController( i.get<ProductRepository>()  ))  ,
    
    

    //repository
    Bind( (i) => CategoryRepository(i.get<Dio>())), 
    Bind ( (i) => ProductRepository(i.get<Dio>())),
    Bind( (i) => Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"))),

    //Model
    // Bind( (i) => CategoryModel()),
    // Bind((i) => HomeController())
  ];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
    // ModularRouter("/cart" , child: (_,args) => CartPage())
        
  ];

  static Inject get to => Inject<HomeModule>.of();
}
