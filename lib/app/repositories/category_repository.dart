import 'package:dio/dio.dart';
import 'package:ecomerce/app/shared/models/categpry_model.dart';
import 'package:flutter_modular/flutter_modular.dart';


@Injectable()
class CategoryRepository extends Disposable {
  final Dio client;

  CategoryRepository(this.client);

  Future<List<CategoryModel>> fetchCategory() async {
    try
    {
      final response =  await client.get('/Categories');
      return (response.data as List).map((e) => CategoryModel.fromJSON(e)).toList();
    } on DioError catch(e)
    {
      throw (e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
