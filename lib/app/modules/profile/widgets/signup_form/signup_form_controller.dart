import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'signup_form_controller.g.dart';

@Injectable()
class SignupFormController = _SignupFormControllerBase
    with _$SignupFormController;

abstract class _SignupFormControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
