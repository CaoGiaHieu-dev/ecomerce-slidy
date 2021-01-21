// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_in_category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductInCategoryController on _ProductInCategoryControllerBase, Store {
  final _$productListAtom =
      Atom(name: '_ProductInCategoryControllerBase.productList');

  @override
  ObservableFuture<List<ProductModel>> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(ObservableFuture<List<ProductModel>> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  @override
  String toString() {
    return '''
productList: ${productList}
    ''';
  }
}
