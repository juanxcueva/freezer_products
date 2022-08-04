



import 'package:freezer_products/app/data/resources/remote/user_api.dart';
import 'package:freezer_products/app/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserAPI _api;
  UserRepositoryImpl(this._api);

  @override
  Future<Map<String, dynamic>> getUser() => _api.getUser();

  
 
}
