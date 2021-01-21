import 'package:dio/dio.dart';
import 'package:ecomerce/app/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

// part 'product_repository.g.dart';

@Injectable()
class ProductRepository extends Disposable {
  final Dio client;

  ProductRepository(this.client);

  Future<List<ProductModel>> fetchProduct() async {
    try
    {
      final response =  await client.get('/products');
      return (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
    } on DioError catch(e)
    {
      throw (e.message);
    }
  }

  Future<List<ProductModel>> fetchLimitProduct() async {
    try
    {
      final response =  await client.get('/products?limit=6');
      return (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
    } on DioError catch(e)
    {
      throw (e.message);
    }
  }

  Future<List<ProductModel>> fetchProductInCategory(String category) async
  {
    try
    {
      final response = await client.get('/products/category/$category');
      return (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
    } on DioError catch(e)
    {
      throw (e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
