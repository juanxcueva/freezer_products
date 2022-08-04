import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/data/resources/local/error_handler.dart';

class FreezerAPI {
  final _dio = Get.i.find<Dio>();

  Future<Map<String, dynamic>> getProducts() async {
    Map<String, dynamic> newResponse;
    print('llega -> Pedir products');
    try {
      final response = await _dio.get('/fridge/user/products/',
          options: Options(headers: {"userId": 1}));
      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }

  Future<Map<String, dynamic>> deleteProduct(int id) async {
    Map<String, dynamic> newResponse;
    print('llega -> Delete products');
    try {
      final response = await _dio.delete('/fridge/user/products/$id',
          options: Options(headers: {"userId": 1}));

      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }

  Future<Map<String, dynamic>> getFreezer() async {
    Map<String, dynamic> newResponse;
    print('llega -> Pedir freezer ');
    try {
      final response = await _dio.get('/fridge/user/freezer/',
          options: Options(headers: {"userId": 1}));
      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }

  Future<Map<String, dynamic>> editFreezer(int id, double refrigerador,double congelador) async {
    Map<String, dynamic> newResponse;
    print('llega -> Editar freezer');
    try {
      final response=await _dio.put('/fridge/user/freezer/',
          options: Options(headers: {"userId": 1}),
          data: {
            "fre_id":id,
            "fre_grados_refrigerador": refrigerador,
            "fre_grados_congelador": congelador,
          });

      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }
}
