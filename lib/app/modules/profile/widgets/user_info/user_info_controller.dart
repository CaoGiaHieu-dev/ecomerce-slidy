import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'user_info_controller.g.dart';

@Injectable()
class UserInfoController = _UserInfoControllerBase with _$UserInfoController;

abstract class _UserInfoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
