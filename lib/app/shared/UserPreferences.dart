import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences 
{
  static final UserPrefrences _instance = UserPrefrences._ctor();

  factory  UserPrefrences()
  {
    return _instance;
  }

  UserPrefrences._ctor() ;

  SharedPreferences _preferences;

  init() async
  {
    _preferences = await SharedPreferences.getInstance();
  }
  
  // #region Get Data
  get getUserName
  {
    return _preferences.getString("username") ?? "";
  }

  get getPassword
  {
    return _preferences.getString("password") ?? "";
  }

  List<String> getListFavorite(String userId)
  {
    return _preferences.getStringList(userId);
  }
  // #endregion

  //#region Set Data
  Future setUserName (String username) async
  {
    await _preferences.setString("username", username);
  }

  Future setPassword (String password) async
  {
     await _preferences.setString('password',password) ;
  }

  Future setListFavorite (String userId , List<String> list) async
  {
     await _preferences.setStringList(userId,list) ;
  }
  //#endregion
}