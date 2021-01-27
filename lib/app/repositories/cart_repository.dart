
import 'package:dio/dio.dart';
import 'package:ecomerce/app/shared/models/cart_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
//     final http.Response response = await http.post
//     (
//       'https://fakestoreapi.com/carts',
//       headers: <String, String>
//       {
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode
//       (
//         <dynamic,dynamic>
//         {
//           'date' : date,
//           'userId' : userId,
//           'productlist' : productlist,
//           'iV' : iV,
//         } 
//       )
//     );
// 
//     if (response.statusCode == 200) 
//     {
//       // return response;
//       return CartModel.fromJson(jsonDecode(response.body));
//     } 
//     else 
//     {
//       throw Exception('Failed to post cart.');
//     }
  }
  

  //dispose will be called automatically
  @override
  void dispose() {}
}
