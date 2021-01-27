// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_contact_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditContactController on _EditContactControllerBase, Store {
  final _$valueAtom = Atom(name: '_EditContactControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_EditContactControllerBaseActionController =
      ActionController(name: '_EditContactControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_EditContactControllerBaseActionController
        .startAction(name: '_EditContactControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_EditContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
