import 'package:flutter_modular/flutter_modular.dart';

  
  class FabModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    // Bind((i) =>CartController())
  ];

  @override
  List<ModularRouter> get routers => 
  [
    // ModularRouter("/cart" , child: (_,args) => CartPage())
  ];

  static Inject get to => Inject<FabModule>.of();

}
  