
import 'dart:convert';

import 'package:freezer_products/app/domain/models/product_model.dart';

class ProductsResponse {
    ProductsResponse({
        required this.productos,
    });

    List<ProductoModel> productos;

    factory ProductsResponse.fromJson(String str) => ProductsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductsResponse.fromMap(Map<String, dynamic> json) => ProductsResponse(
        productos: List<ProductoModel>.from(json["productos"].map((x) => ProductoModel.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
    };
}

