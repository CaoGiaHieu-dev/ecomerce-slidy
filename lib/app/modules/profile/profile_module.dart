import 'widgets/login/login_controller.dart';
import 'package:ecomerce/app/modules/profile/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i) => LoginController()),
  ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ProfilePage()),
      ];

  static Inject get to => Inject<ProfileModule>.of();
}
