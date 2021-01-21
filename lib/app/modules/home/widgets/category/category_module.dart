import 'package:dio/dio.dart';
import 'package:ecomerce/app/modules/home/widgets/category/category_page.dart';
import 'package:ecomerce/app/modules/product_in_category/product_in_category_controller.dart';
import 'package:ecomerce/app/modules/product_in_category/product_in_category_page.dart';
import 'package:ecomerce/app/repositories/product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i) =>ProductInCategoryController(i.get<ProductRepository>(),Modular.args.data )),


    //repository
    Bind( (i) => Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"))),
    Bind( (i)=> ProductRepository(i.get<Dio>()) )
  ];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter(Modular.initialRoute, child: (_, args) => CategoryPage()),
    ModularRouter
    (
      "/category/:name", 
      child: (_, args) => ProductInCategoryPage(),
    )
  ];

  static Inject get to => Inject<CategoryModule>.of();
}
