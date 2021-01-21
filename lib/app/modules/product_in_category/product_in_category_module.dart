import 'package:ecomerce/app/modules/product_in_category/product_in_category_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductInCategoryModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    
  ];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter(Modular.initialRoute, child : (_,args) => ProductInCategoryPage(title: args.data,)),
  ];

  static Inject get to => Inject<ProductInCategoryModule>.of();
}
