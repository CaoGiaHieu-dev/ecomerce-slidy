import 'package:ecomerce/app/modules/detail/detail_controller.dart';
import 'package:ecomerce/app/modules/home/widgets/hot_items/hot_items_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HotItemsModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i) => DetailController())
  ];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter(Modular.initialRoute, child: (_, args) => HotItemsPage()),  
    // ModularRouter("/detail", child: (_, args) => DetailPage(data: args.data))
  ];

  static Inject get to => Inject<HotItemsModule>.of();
}
