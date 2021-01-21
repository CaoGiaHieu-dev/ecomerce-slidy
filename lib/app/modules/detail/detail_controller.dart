import 'package:ecomerce/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detail_controller.g.dart';

@Injectable()
class DetailController = _DetailControllerBase with _$DetailController;

abstract class _DetailControllerBase with Store {
  @observable
  List<ProductModel> listCart ;

  @action
  void addToCart(ProductModel data) 
  {
    listCart.add(data);
  }
}
