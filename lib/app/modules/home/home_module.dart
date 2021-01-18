import 'package:dio/dio.dart';
import 'package:ecomerce/app/modules/home/widgets/category_repository.dart';

import 'widgets/category/category_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind((i) => CategoryController(i.get<CategoryRepository>())),
    Bind( (i) => CategoryRepository(i.get<Dio>())), 
    Bind( (i) => Dio(BaseOptions(baseUrl: "https://5f96864411ab98001603ac4b.mockapi.io")))
    // Bind((i) => HomeController())
  ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        // ModularRouter
        // (
        //   "/detail",
        //   module: DetailModule(),
        // )
      ];

  static Inject get to => Inject<HomeModule>.of();
}
