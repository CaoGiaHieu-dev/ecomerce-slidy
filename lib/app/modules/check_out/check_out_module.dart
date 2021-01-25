import 'package:ecomerce/app/modules/check_out/check_out_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CheckOutModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter(Modular.initialRoute, child: (_, args) => CheckOutPage() ),
  ];

  static Inject get to => Inject<CheckOutModule>.of();
}
