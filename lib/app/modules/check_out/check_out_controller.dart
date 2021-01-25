import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'check_out_controller.g.dart';

@Injectable()
class CheckOutController = _CheckOutControllerBase with _$CheckOutController;

abstract class _CheckOutControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
