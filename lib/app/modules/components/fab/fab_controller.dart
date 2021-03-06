import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'fab_controller.g.dart';

@Injectable()
class FabController = _FabControllerBase with _$FabController;

abstract class _FabControllerBase with Store {
}
