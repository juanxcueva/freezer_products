// To parse this JSON data, do
//
//     final puertaResponse = puertaResponseFromMap(jsonString);

import 'dart:convert';

class PuertaResponse {
    PuertaResponse({
        required this.tipo,
        required this.descripcion,
        required this.mostrar,
    });

    String tipo;
    String descripcion;
    bool mostrar;

    factory PuertaResponse.fromJson(String str) => PuertaResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PuertaResponse.fromMap(Map<String, dynamic> json) => PuertaResponse(
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        mostrar: json["mostrar"],
    );

    Map<String, dynamic> toMap() => {
        "tipo": tipo,
        "descripcion": descripcion,
        "mostrar": mostrar,
    };
}
