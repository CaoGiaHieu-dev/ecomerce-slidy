import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'header_controller.g.dart';

@Injectable()
class HeaderController = _HeaderControllerBase with _$HeaderController;

abstract class _HeaderControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
