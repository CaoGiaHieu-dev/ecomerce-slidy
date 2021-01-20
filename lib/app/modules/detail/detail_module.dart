import 'package:ecomerce/app/modules/detail/detail_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detail_page.dart';

class DetailModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i)=> DetailController())
  ];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter(Modular.initialRoute, child: (_, args) => DetailPage(data: args.data,)),
    // ModularRouter
    // (
    //   "/:name", 
    //   child: (_, args) => DetailPage
    //   ( 
    //   )
    // ),
  ];

  static Inject get to => Inject<DetailModule>.of();
}