import 'package:ecomerce/app/modules/cart/widgets/checkout/checkout_controller.dart';
import 'package:ecomerce/app/modules/check_out/check_out_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cart_page.dart';

class CartModule extends ChildModule {
  @override
  List<Bind> get binds => 
  [
    Bind( (i)=> CheckoutController())
  ];

  @override
  List<ModularRouter> get routers => 
  [
    ModularRouter(Modular.initialRoute, child: (_, args) => CartPage()),

    ModularRouter
    (
      "/checkout",
      child: (_,args) => CheckOutPage()
    )
  ];

  static Inject get to => Inject<CartModule>.of();
}
