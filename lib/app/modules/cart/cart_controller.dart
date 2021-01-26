import 'package:ecomerce/app/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

@Injectable()
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  ObservableList<ProductModel> cart =ObservableList<ProductModel>() ;

  @observable
  ObservableList<ProductModel> cartShow =ObservableList<ProductModel>() ;

  @computed
  ObservableList<ProductModel> get listCart => ObservableList.of(cart);
  

  @action
  void addToCart(ProductModel data) 
  {
    cart.add(data);
  }
  @action
  void removeItems(ProductModel data) 
  {
    cart.remove(data);
  }

  @action
  void deteleItems(ProductModel data)
  {
    cart.removeWhere((element) => element==data);
  }
  
}
