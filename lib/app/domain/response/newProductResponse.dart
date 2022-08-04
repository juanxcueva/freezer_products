


import 'dart:convert';

import 'package:freezer_products/app/domain/models/product_model.dart';

class NewProductResponse {
    NewProductResponse({
        required this.producto,
    });

    ProductoModel producto;

    factory NewProductResponse.fromJson(String str) => NewProductResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NewProductResponse.fromMap(Map<String, dynamic> json) => NewProductResponse(
        producto: ProductoModel.fromMap(json["producto"]),
    );

    Map<String, dynamic> toMap() => {
        "producto": producto.toMap(),
    };
}


