import 'package:ecomerce/app/repositories/product_repository.dart';
import 'package:ecomerce/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';


part 'hot_items_controller.g.dart';

@Injectable()
class HotItemsController = _HotItemsControllerBase with _$HotItemsController;

abstract class _HotItemsControllerBase with Store {

  final ProductRepository _productRepository;

  @observable
  ObservableFuture<List<ProductModel>> productList;
  

  @action
  _HotItemsControllerBase(this._productRepository   )
  {
    fetchHotProduct();
  }

  void fetchHotProduct() 
  {
    productList = _productRepository.fetchLimitProduct().asObservable();
  }
}
