import 'package:dio/dio.dart';
import 'package:ecomerce/app/modules/check_out/check_out_page.dart';
import 'package:ecomerce/app/repositories/cart_repository.dart';
import 'package:ecomerce/app/repositories/user_repository.dart';
import 'package:ecomerce/constaints/constaints.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CheckOutModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i) => Dio(BaseOptions(baseUrl: base_url))),
    Bind( (i)=> CartRepository(i.get<Dio>()) ),
    Bind( (i)=> UserRepository(i.get<Dio>()) )
  ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => CheckOutPage()),
      ];

  static Inject get to => Inject<CheckOutModule>.of();
}
