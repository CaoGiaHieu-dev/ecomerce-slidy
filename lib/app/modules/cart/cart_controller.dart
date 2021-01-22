import 'package:ecomerce/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cart_controller.g.dart';

@Injectable()
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  ObservableList<ProductModel> cart =ObservableList<ProductModel>() ;

  @computed
  ObservableList<ProductModel> get listCart => ObservableList.of(cart);

  @action
  void addToCart(ProductModel data) 
  {
    cart.add(data);
  }
}
