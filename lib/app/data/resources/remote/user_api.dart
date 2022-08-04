import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/data/resources/local/error_handler.dart';

class UserAPI {
  final _dio = Get.i.find<Dio>();

  Future<Map<String, dynamic>> getUser() async {
    Map<String, dynamic> newResponse;
    print('llega -> Pedir user');
    try {
      final response = await _dio.get(
        '/fridge/user/loggin/1',
      );
      newResponse = returnResponse(response);
    } on DioError catch (e) {
      newResponse = returnResponse(e.response);
    }
    return newResponse;
  }
}
