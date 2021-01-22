import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'checkout_controller.g.dart';

@Injectable()
class CheckoutController = _CheckoutControllerBase with _$CheckoutController;

abstract class _CheckoutControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
