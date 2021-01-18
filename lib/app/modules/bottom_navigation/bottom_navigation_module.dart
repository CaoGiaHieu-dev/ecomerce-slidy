import 'package:ecomerce/app/modules/bottom_navigation/bottom_navigation_controller.dart';
import 'package:ecomerce/app/modules/bottom_navigation/bottom_navigation_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigationModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i) => BottomNavigationController())
  ];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter(Modular.initialRoute, child: (_, args) => BottomNavigationPage()),
  ];

  static Inject get to => Inject<BottomNavigationModule>.of();
}
