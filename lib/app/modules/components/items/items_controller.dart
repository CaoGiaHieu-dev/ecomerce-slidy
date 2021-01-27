import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'items_controller.g.dart';

@Injectable()
class ItemsController = _ItemsControllerBase with _$ItemsController;

abstract class _ItemsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
