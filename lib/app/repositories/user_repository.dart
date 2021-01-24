import 'package:dio/dio.dart';
import 'package:ecomerce/app/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

// part 'user_repository.g.dart';

@Injectable()
class UserRepository extends Disposable {
  final Dio client;

  UserRepository(this.client);

  Future<List<UserModel>> fetchUser() async 
  {
    try
    {
      final response = await client.get('/users');
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    }on DioError catch(e)
    {
      throw (e.message);
    }    
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
