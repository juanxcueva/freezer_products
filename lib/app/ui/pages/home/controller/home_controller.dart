import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:freezer_products/app/domain/models/product_model.dart';
import 'dart:async';

import 'package:freezer_products/app/domain/repository/freezer_repository.dart';
import 'package:freezer_products/app/domain/response/newProductResponse.dart';
import 'package:freezer_products/app/domain/response/productsResponse.dart';
import 'package:freezer_products/app/domain/response/puertaResponse.dart';

class HomeController extends SimpleNotifier {
  final _freezerRepository = Get.i.find<FreezerRepository>();
  String error = "";
  List<ProductoModel> listProducts = [];
  List<ProductoModel> listProductsAux = [];
  
  bool navigate = false;
  bool puertaAbierta = false;
  bool expiration = false;
  bool agotado = false;


  late NewProductResponse responseAux;
  late ProductoModel expirationAux;
  late ProductoModel agotadoAux;




  HomeController() {
    getProducts();
    final clientOptions = ably.ClientOptions(
        key: 'n7RG0Q.d84DHw:qjjVylep9Owge7OuBWntDWNVWJkroaxOBBa4IEvxsj8');
    ably.Realtime realtime = ably.Realtime(options: clientOptions);
    ably.Rest rest = ably.Rest(options: clientOptions);

    realtime.connection
        .on()
        .listen((ably.ConnectionStateChange stateChange) async {
      // Handle connection state change events
    });

    ably.RealtimeChannel channel = realtime.channels.get('alertas');
    StreamSubscription<ably.Message> subscription =
        channel.subscribe(name: '1').listen((ably.Message message) {
      print(message.data);
      PuertaResponse puertaResponse= PuertaResponse.fromJson(message.data.toString());
      puertaAbierta = true;
      notify();
      puertaAbierta = false;
      print("eee");
    });

    

    ably.RealtimeChannel channel2 = realtime.channels.get('product_create');
    StreamSubscription<ably.Message> subscription2 =
        channel2.subscribe(name: '1').listen((ably.Message message) {
      print(message.data);
      NewProductResponse response = NewProductResponse.fromJson(message.data.toString());
      print(response.producto.proId);
      print(response.producto.proNombre);
      print(response.producto.proCantidad);
      print(response.producto.proFechaVencimiento);
      responseAux = response;
      navigate = true;
      notify();
      navigate = false;
      getProducts();  // Actualiza la lista de productos
    });

    ably.RealtimeChannel channel3 = realtime.channels.get('product_expiration');
    StreamSubscription<ably.Message> subscription3 =
        channel3.subscribe(name: '1').listen((ably.Message message) {
      print(message.data);
      ProductoModel producto = ProductoModel.fromJson(message.data.toString());
      expirationAux = producto;
      expiration=true;
      notify();
      expiration=false;
    });

    ably.RealtimeChannel channel4 = realtime.channels.get('product_out');
    StreamSubscription<ably.Message> subscription4 =
        channel4.subscribe(name: '1').listen((ably.Message message) {
      print(message.data);
      ProductoModel producto = ProductoModel.fromJson(message.data.toString());
      agotadoAux = producto;
      agotado=true;
      notify();
      agotado=false;
    });
  }

// Create an instance of ClientOptions with Ably key
// Use ClientOptions to create Realtime or REST instance

  // void addProduct(Object? value) {
  //   listProductsAux.addAll(listProducts);
  //   listProducts = [];
  //   print(listProducts.length);
    
  //   listProductsAux.add(value);
  //   listProducts.addAll(listProductsAux);
  //   listProductsAux.clear();
  //   print(listProducts.length);
  //   print("agrego el valor");
  //   notify();
  //   print("notifico cambios");
  // }

  Future<void> getProducts() async {
    try {
      Map<String, dynamic> response = await _freezerRepository.getProducts();
      if (response["error"] != null) {
        error = response["msg"];
        listProducts = [];
      } else {
        print("sssssss");
        print(response["data"]);
        ProductsResponse productsResponse =
            ProductsResponse.fromMap(response['data']);
        listProducts = productsResponse.productos;
        print("sssssss");
        print("productos es;");
        print(listProducts);
        // print("mando a actualizar2");
      }
      notify();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> deleteProduct(int index) async {
    try {
      Map<String, dynamic> response = await _freezerRepository.deleteProduct(id: index);
      if (response["error"] != null) {
        error = response["msg"];
        return false;
      } else {
        await getProducts();
        return true;
      }
    } catch (e) {
      print(e);
      error = "Existe un error al eliminar el producto";
      return false;
    }
  }

}
