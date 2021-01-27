// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoryController on _HistoryControllerBase, Store {
  final _$userIdAtom = Atom(name: '_HistoryControllerBase.userId');

  @override
  int get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$cartListAtom = Atom(name: '_HistoryControllerBase.cartList');

  @override
  ObservableFuture<List<CartModel>> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(ObservableFuture<List<CartModel>> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HistoryControllerBase.isLoading');

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

  final _$_HistoryControllerBaseActionController =
      ActionController(name: '_HistoryControllerBase');

  @override
  dynamic fetchUserCart(int id) {
    final _$actionInfo = _$_HistoryControllerBaseActionController.startAction(
        name: '_HistoryControllerBase.fetchUserCart');
    try {
      return super.fetchUserCart(id);
    } finally {
      _$_HistoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
cartList: ${cartList},
isLoading: ${isLoading}
    ''';
  }
}
