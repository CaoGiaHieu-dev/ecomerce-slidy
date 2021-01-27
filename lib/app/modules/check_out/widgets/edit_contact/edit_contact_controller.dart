import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'edit_contact_controller.g.dart';

@Injectable()
class EditContactController = _EditContactControllerBase
    with _$EditContactController;

abstract class _EditContactControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
