import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_form_controller.g.dart';

@Injectable()
class LoginFormController = _LoginFormControllerBase with _$LoginFormController;

abstract class _LoginFormControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
