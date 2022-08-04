


import 'package:freezer_products/app/data/resources/remote/freezer_api.dart';
import 'package:freezer_products/app/domain/repository/freezer_repository.dart';

class FreezerRepositoryImpl extends FreezerRepository {
  final FreezerAPI _api;
  FreezerRepositoryImpl(this._api);

  @override
  Future<Map<String, dynamic>> getProducts() => _api.getProducts();

  @override
  Future<Map<String, dynamic>> deleteProduct({required int id}) => _api.deleteProduct(id);

  @override
  Future<Map<String, dynamic>> editFreezer({required int id, required double refrigerador, required double congelador}) => _api.editFreezer(id, refrigerador, congelador);

  @override
  Future<Map<String, dynamic>> getFreezer() => _api.getFreezer();

 
}
