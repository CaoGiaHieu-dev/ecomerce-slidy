
import 'package:ecomerce/app/repositories/user_repository.dart';
import 'package:ecomerce/app/shared/UserPreferences.dart';
import 'package:ecomerce/app/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store 
{
  final UserRepository repository ;

  
  @observable
  bool isLogin = false;

  @observable
  bool isLoading = true;

  @observable
  String userName = UserPrefrences().getUserName ;

  @observable
  String passWord = UserPrefrences().getPassword;

  @observable
  ObservableFuture<List<UserModel>> userList; 

  @observable
  ObservableList<UserModel> user =ObservableList<UserModel>() ; 

  @computed
  ObservableList<UserModel> get getUser => ObservableList.of(user);

  _ProfileControllerBase(this.repository)
  {
    userList = repository.fetchUser().asObservable().whenComplete(() => 
    {
      isLoading=false ,
      // login() 
    });
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
          storageUser(userName,passWord);
          user.add(element);
        }
      }
    );
    return isLogin;
  }

  @action
  bool logout()
  {
    user.isEmpty;
    return isLogin= false;
  }

  @action
  void storageUser(String _username ,String _password)
  {
    UserPrefrences().setUserName(_username);
    UserPrefrences().setPassword(_password);
  }
}
