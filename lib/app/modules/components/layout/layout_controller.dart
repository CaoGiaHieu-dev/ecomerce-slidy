import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'layout_controller.g.dart';

@Injectable()
class LayoutController = _LayoutControllerBase with _$LayoutController;

abstract class _LayoutControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
