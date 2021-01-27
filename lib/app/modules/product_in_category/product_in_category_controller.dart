import 'package:ecomerce/app/repositories/product_repository.dart';
import 'package:ecomerce/app/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'product_in_category_controller.g.dart';

@Injectable()
class ProductInCategoryController = _ProductInCategoryControllerBase
    with _$ProductInCategoryController;

abstract class _ProductInCategoryControllerBase with Store {
  final ProductRepository repository;
  final String name;

  @observable
  ObservableFuture<List<ProductModel>> productList;


  @action
  // setCategoryName(String name ) => categoryId=name;

  @action
  _ProductInCategoryControllerBase(this.repository, this.name )
  {
    fetchProduct(name);
    
  }

  fetchProduct( String nameCategory)
  {
    if(nameCategory !=null)
    {
      productList = repository.fetchProductInCategory(nameCategory).asObservable();
    }
  }


}
