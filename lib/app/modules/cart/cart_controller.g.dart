// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  Computed<ObservableList<ProductModel>> _$listCartComputed;

  @override
  ObservableList<ProductModel> get listCart => (_$listCartComputed ??=
          Computed<ObservableList<ProductModel>>(() => super.listCart,
              name: '_CartControllerBase.listCart'))
      .value;

  final _$cartAtom = Atom(name: '_CartControllerBase.cart');

  @override
  ObservableList<ProductModel> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(ObservableList<ProductModel> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  final _$cartShowAtom = Atom(name: '_CartControllerBase.cartShow');

  @override
  ObservableList<ProductModel> get cartShow {
    _$cartShowAtom.reportRead();
    return super.cartShow;
  }

  @override
  set cartShow(ObservableList<ProductModel> value) {
    _$cartShowAtom.reportWrite(value, super.cartShow, () {
      super.cartShow = value;
    });
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void addToCart(ProductModel data) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addToCart');
    try {
      return super.addToCart(data);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItems(ProductModel data) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeItems');
    try {
      return super.removeItems(data);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deteleItems(ProductModel data) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.deteleItems');
    try {
      return super.deteleItems(data);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart},
cartShow: ${cartShow},
listCart: ${listCart}
    ''';
  }
}
