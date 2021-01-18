import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'bottom_navigation_controller.g.dart';

@Injectable()
class BottomNavigationController = _BottomNavigationControllerBase
    with _$BottomNavigationController;

abstract class _BottomNavigationControllerBase with Store {
  @observable
  int tabIndex = 0;

  @action
  void setCurrnetIndex(int value) 
  {
    tabIndex = value;
  }
}
