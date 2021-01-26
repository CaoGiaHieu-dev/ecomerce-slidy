import 'package:ecomerce/app/repositories/cart_repository.dart';
import 'package:ecomerce/app/shared/models/cart_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'check_out_controller.g.dart';

@Injectable()
class CheckOutController = _CheckOutControllerBase with _$CheckOutController;

abstract class _CheckOutControllerBase with Store {
  final CartRepository repository ;

  _CheckOutControllerBase(this.repository);

  @action
  void payment(CartModel data)
  {
    repository.postCart(data.userId, data.date, data.products, data.iV);
  }

}
