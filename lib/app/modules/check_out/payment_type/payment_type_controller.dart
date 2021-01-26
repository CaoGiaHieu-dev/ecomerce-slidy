import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'payment_type_controller.g.dart';

@Injectable()
class PaymentTypeController = _PaymentTypeControllerBase
    with _$PaymentTypeController;

abstract class _PaymentTypeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
