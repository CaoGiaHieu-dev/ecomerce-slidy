import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecomerce/app/shared/models/cart_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

// part 'cart_repository.g.dart';

@Injectable()
class CartRepository extends Disposable 
{
  final Dio client;

  CartRepository(this.client);

  Future fetchCart() async 
  {
    try
    {
      final response =  await client.get('/products');
      return (response.data as List).map((e) => CartModel.fromJson(e)).toList();
    } on DioError catch(e)
    {
      throw (e.message);
    }
  }

  Future<CartModel> postCart(int userId ,String date , List<Products> productlist , int iV) async
  {
    final http.Response response = await http.post
    (
      'https://fakestoreapi.com/carts',
      headers: <String, String>
      {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode
      (
        <dynamic,dynamic>
        {
          'date' : date,
          'userId' : userId,
          'productlist' : productlist,
          'iV' : iV,
        } 
      )
    );

    if (response.statusCode == 200) 
    {
      // return response;
      return CartModel.fromJson(jsonDecode(response.body));
    } 
    else 
    {
      throw Exception('Failed to post cart.');
    }
  }
  

  //dispose will be called automatically
  @override
  void dispose() {}
}
