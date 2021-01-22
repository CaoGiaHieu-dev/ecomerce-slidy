import 'package:ecomerce/app/modules/components/header/header_controller.dart';
import 'package:ecomerce/app/modules/detail/detail_controller.dart';
import 'package:ecomerce/app/modules/detail/detail_page.dart';
import 'package:ecomerce/app/modules/product_in_category/product_in_category_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductInCategoryModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i) => HeaderController()),
    Bind( (i)=> DetailController()),
  ];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter
    (
      Modular.initialRoute,
      child : (_,args) => ProductInCategoryPage(title: args.data,)
    ),
    ModularRouter
    (
      "/detail",
      child: (_,args) =>DetailPage()
    )
  ];

  static Inject get to => Inject<ProductInCategoryModule>.of();
}
