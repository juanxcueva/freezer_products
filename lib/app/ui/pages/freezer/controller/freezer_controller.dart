

import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/domain/models/product_model.dart';
import 'dart:async';

import 'package:freezer_products/app/domain/repository/freezer_repository.dart';
import 'package:freezer_products/app/domain/response/freezerResponse.dart';

class FreezerController extends SimpleNotifier {
  final _freezerRepository = Get.i.find<FreezerRepository>();
  String error = "";
  List<ProductoModel> listProducts = [];
  List<ProductoModel> listProductsAux = [];
  double congTemp = 0;
  double refTemp = 0;
  double congTempAux = 0;
  double refTempAux = 0;

  FreezerController(){
    getFreezer();

  }

  changeCongelador(double temp){
    congTempAux = temp;
    print("cong");
    notify();
  }

  changeRefrigerador(double temp){
    refTempAux = temp;
    print("refff");
    notify();
  }


  Future<void> getFreezer() async {
    try {
      Map<String, dynamic> response = await _freezerRepository.getFreezer();
      if (response["error"] != null) {
        error = response["msg"];
        listProducts = [];
      } else {
        print(response["data"]);
        FreezerResponse freezerResponse =
            FreezerResponse.fromMap(response['data']);
        print(freezerResponse.freGradosCongelador);
        print(freezerResponse.freGradosRefrigerador);
        congTemp = freezerResponse.freGradosCongelador.toDouble();
        refTemp=freezerResponse.freGradosRefrigerador.toDouble();
        notify();
      }
      notify();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> editFreezer(int id,double refrigerador,double congelador ) async {
    try {
      print(refrigerador);
      print(congelador);
      Map<String, dynamic> response = await _freezerRepository.editFreezer(id: id, refrigerador: refrigerador, congelador: congelador);
      print(response);
      print("editadoooooooooo");
      if (response["error"] != null) {
        error = response["msg"];
        return false;
      } else {
        await getFreezer();
        return true;
      }
    } catch (e) {
      print(e);
      error = "Existe un error al editar el refrigerador";
      return false;
    }
  }

}
