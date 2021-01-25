import 'package:dio/dio.dart';
import 'package:ecomerce/app/modules/profile/profile_page.dart';
import 'package:ecomerce/app/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/login/login_controller.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i) => LoginController()),

    //repository
    Bind( (i) => Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"))),
    Bind( (i)=> UserRepository(i.get<Dio>()),lazy: true )

  ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ProfilePage() ),
      ];

  static Inject get to => Inject<ProfileModule>.of();
}
