

abstract class FreezerRepository {


  Future<Map<String, dynamic>> getProducts();

  Future<Map<String, dynamic>> deleteProduct({required int id});
  

  Future<Map<String, dynamic>> getFreezer();

  Future<Map<String, dynamic>> editFreezer({required int id, required double refrigerador, required double congelador});

  
}
