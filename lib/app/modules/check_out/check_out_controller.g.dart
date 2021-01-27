// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckOutController on _CheckOutControllerBase, Store {
  final _$statusAtom = Atom(name: '_CheckOutControllerBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$paymentAsyncAction = AsyncAction('_CheckOutControllerBase.payment');

  @override
  Future<void> payment(CartModel data) {
    return _$paymentAsyncAction.run(() => super.payment(data));
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
