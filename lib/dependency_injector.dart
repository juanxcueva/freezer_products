import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/data/repository_impl/freezer_repository_impl.dart';
import 'package:freezer_products/app/data/repository_impl/user_repository_impl.dart';
import 'package:freezer_products/app/data/resources/remote/freezer_api.dart';
import 'package:freezer_products/app/data/resources/remote/user_api.dart';
import 'package:freezer_products/app/domain/repository/freezer_repository.dart';
import 'package:freezer_products/app/domain/repository/user_repository.dart';

void injectDependencies() {
  //var´s

  // String url = "https://productosmicroapi.herokuapp.com/";
  String url = "http://44.205.153.171:8080/";


  Dio _dio = Dio(BaseOptions(baseUrl: url));
  (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  //Inject Dio
  Get.i.lazyPut<Dio>(() => _dio);

  Get.i.lazyPut<FreezerRepository>(() => FreezerRepositoryImpl(
        FreezerAPI(),
      ));
  
  Get.i.lazyPut<UserRepository>(() => UserRepositoryImpl(
        UserAPI(),
      ));
}
