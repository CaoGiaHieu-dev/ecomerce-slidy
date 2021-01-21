// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailController on _DetailControllerBase, Store {
  final _$listCartAtom = Atom(name: '_DetailControllerBase.listCart');

  @override
  ObservableList<ProductModel> get listCart {
    _$listCartAtom.reportRead();
    return super.listCart;
  }

  @override
  set listCart(ObservableList<ProductModel> value) {
    _$listCartAtom.reportWrite(value, super.listCart, () {
      super.listCart = value;
    });
  }

  final _$_DetailControllerBaseActionController =
      ActionController(name: '_DetailControllerBase');

  @override
  void addToCart(ProductModel data) {
    final _$actionInfo = _$_DetailControllerBaseActionController.startAction(
        name: '_DetailControllerBase.addToCart');
    try {
      return super.addToCart(data);
    } finally {
      _$_DetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listCart: ${listCart}
    ''';
  }
}
