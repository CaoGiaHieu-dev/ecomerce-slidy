// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigationController on _BottomNavigationControllerBase, Store {
  final _$tabIndexAtom = Atom(name: '_BottomNavigationControllerBase.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  final _$_BottomNavigationControllerBaseActionController =
      ActionController(name: '_BottomNavigationControllerBase');

  @override
  void setCurrnetIndex(int value) {
    final _$actionInfo = _$_BottomNavigationControllerBaseActionController
        .startAction(name: '_BottomNavigationControllerBase.setCurrnetIndex');
    try {
      return super.setCurrnetIndex(value);
    } finally {
      _$_BottomNavigationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex}
    ''';
  }
}
