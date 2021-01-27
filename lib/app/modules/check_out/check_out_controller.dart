import 'package:ecomerce/app/repositories/cart_repository.dart';
import 'package:ecomerce/app/shared/models/cart_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'check_out_controller.g.dart';

@Injectable()
class CheckOutController = _CheckOutControllerBase with _$CheckOutController;

abstract class _CheckOutControllerBase with Store {
  final CartRepository repository ;

  @observable
  String status = "";

  // @observable
  String phoneNumber;

  _CheckOutControllerBase(this.repository);

  @action
  Future<void> payment(CartModel data) async
  {
    // repository.postCart(data.userId, data.date, data.products, data.iV);
    await repository.postCart(data).then((value) => 
    {
      status = value
    });
  }
}
