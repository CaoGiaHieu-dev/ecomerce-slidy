import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'detail_controller.g.dart';

@Injectable()
class DetailController = _DetailControllerBase with _$DetailController;

abstract class _DetailControllerBase with Store {

  
}
