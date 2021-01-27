
import 'package:dio/dio.dart';
import 'package:ecomerce/app/shared/models/cart_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

// part 'cart_repository.g.dart';

@Injectable()
class CartRepository extends Disposable 
{
  final Dio client;
  
  CartRepository(this.client);

  Future<List<CartModel>> fetchCart() async 
  {
    try
    {
      final response =  await client.get('/carts');
      return (response.data as List).map((e) => CartModel.fromJson(e)).toList();
    } on DioError catch(e)
    {
      throw (e.message);
    }
  }

  Future<List<CartModel>> fetchUserCart(int id) async 
  {
    try
    {
      final response =  await client.get('/carts/user/$id');
      return (response.data as List).map((e) => CartModel.fromJson(e)).toList();
    } on DioError catch(e)
    {
      throw (e.message);
    }
  }

  Future postCart(CartModel data) async
  {
    try
    {
      final response = await client.post
      (
        "/carts",
        data: data,
        options: Options
        (
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      return response.statusMessage;
    } on DioError catch(e)
    {
      // throw (e.message);
      return e.message;
    }
  }
  

  //dispose will be called automatically
  @override
  void dispose() {}
}
