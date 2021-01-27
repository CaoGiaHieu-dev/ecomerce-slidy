import 'package:ecomerce/app/repositories/cart_repository.dart';
import 'package:ecomerce/app/shared/models/cart_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'history_controller.g.dart';

@Injectable()
class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  
  final CartRepository repository;

  @observable
  int userId;

  @observable
  ObservableFuture<List<CartModel>> cartList; 

// 
//   @observable
//   ObservableList<CartModel> cart =ObservableList<CartModel>() ; 
// 
// 
//   @computed
//   ObservableList<CartModel> get getCart => ObservableList.of(cart);


  @observable
  bool isLoading = true;

  _HistoryControllerBase(this.repository);

  @action
  fetchUserCart(int id)
  {
    cartList = repository.fetchUserCart(id).asObservable().whenComplete(() => 
    {
      isLoading = false
    });
  }
}
