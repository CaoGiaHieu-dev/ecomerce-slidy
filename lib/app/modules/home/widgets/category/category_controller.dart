import 'package:ecomerce/app/repositories/category_repository.dart';
import 'package:ecomerce/app/shared/models/categpry_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'category_controller.g.dart';

@Injectable()
class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store {
  final CategoryRepository repository;
  @observable
  ObservableFuture<List<CategoryModel>> categoryList;

  @action
  _CategoryControllerBase(this.repository)
  {
    categoryList = repository.fetchCategory().asObservable();
  }
}
