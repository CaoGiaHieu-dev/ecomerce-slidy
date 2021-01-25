
import 'package:ecomerce/app/repositories/user_repository.dart';
import 'package:ecomerce/app/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store 
{
  @observable
  bool isLogin = false;

  @observable
  String userName = "" ;

  @observable
  String passWord = "";

  final UserRepository repository ;

  @observable
  ObservableFuture<List<UserModel>> userList; 

  _ProfileControllerBase(this.repository)
  {
    userList = repository .fetchUser().asObservable();
  }
  @action
  bool login() 
  {
    userList.value.takeWhile
    (
      (value) => value.username == userName
    ).forEach
    (
      (element) 
      { 
        if(element.password==passWord )
        {
          isLogin = true;
        }
      }
    );
    return isLogin;
  }
}
