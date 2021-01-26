// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  Computed<ObservableList<UserModel>> _$getUserComputed;

  @override
  ObservableList<UserModel> get getUser => (_$getUserComputed ??=
          Computed<ObservableList<UserModel>>(() => super.getUser,
              name: '_ProfileControllerBase.getUser'))
      .value;

  final _$isLoginAtom = Atom(name: '_ProfileControllerBase.isLogin');

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProfileControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$userNameAtom = Atom(name: '_ProfileControllerBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$passWordAtom = Atom(name: '_ProfileControllerBase.passWord');

  @override
  String get passWord {
    _$passWordAtom.reportRead();
    return super.passWord;
  }

  @override
  set passWord(String value) {
    _$passWordAtom.reportWrite(value, super.passWord, () {
      super.passWord = value;
    });
  }

  final _$userListAtom = Atom(name: '_ProfileControllerBase.userList');

  @override
  ObservableFuture<List<UserModel>> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableFuture<List<UserModel>> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$userAtom = Atom(name: '_ProfileControllerBase.user');

  @override
  ObservableList<UserModel> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableList<UserModel> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase');

  @override
  bool login() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.login');
    try {
      return super.login();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool logout() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.logout');
    try {
      return super.logout();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void storageUser(String _username, String _password) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.storageUser');
    try {
      return super.storageUser(_username, _password);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin},
isLoading: ${isLoading},
userName: ${userName},
passWord: ${passWord},
userList: ${userList},
user: ${user},
getUser: ${getUser}
    ''';
  }
}
