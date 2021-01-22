import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  @observable
  bool isLogin = false;

  @action
  void login() {
    isLogin = true;
  }
}
