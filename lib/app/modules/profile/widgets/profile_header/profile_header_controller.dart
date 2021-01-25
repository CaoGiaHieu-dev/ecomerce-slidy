import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'profile_header_controller.g.dart';

@Injectable()
class ProfileHeaderController = _ProfileHeaderControllerBase
    with _$ProfileHeaderController;

abstract class _ProfileHeaderControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
