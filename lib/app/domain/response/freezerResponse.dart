// To parse this JSON data, do
//
//     final freezerResponse = freezerResponseFromMap(jsonString);

import 'dart:convert';

class FreezerResponse {
    FreezerResponse({
        required this.freId,
        required this.freGradosRefrigerador,
        required this.freGradosCongelador,
    });

    int freId;
    double freGradosRefrigerador;
    double freGradosCongelador;

    factory FreezerResponse.fromJson(String str) => FreezerResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FreezerResponse.fromMap(Map<String, dynamic> json) => FreezerResponse(
        freId: json["fre_id"],
        freGradosRefrigerador: json["fre_grados_refrigerador"].toDouble() ?? 0,
        freGradosCongelador: json["fre_grados_congelador"].toDouble() ?? 0,
    );

    Map<String, dynamic> toMap() => {
        "fre_id": freId,
        "fre_grados_refrigerador": freGradosRefrigerador,
        "fre_grados_congelador": freGradosCongelador,
    };
}
