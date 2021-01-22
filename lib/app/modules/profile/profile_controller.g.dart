// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
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

  final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase');

  @override
  void login() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.login');
    try {
      return super.login();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin}
    ''';
  }
}
