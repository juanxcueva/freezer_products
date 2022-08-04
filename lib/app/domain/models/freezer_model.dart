

import 'dart:convert';

class FreezerModel {
    FreezerModel({
        required this.freId,
        required this.freGradosRefrigerador,
        required this.freGradosCongelador,
    });

    int freId;
    double freGradosRefrigerador;
    double freGradosCongelador;

    factory FreezerModel.fromJson(String str) => FreezerModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FreezerModel.fromMap(Map<String, dynamic> json) => FreezerModel(
        freId: json["fre_id"],
        freGradosRefrigerador: json["fre_grados_refrigerador"].toDouble() ?? 0.0,
        freGradosCongelador: json["fre_grados_congelador"].toDouble() ?? 0.0,
    );

    Map<String, dynamic> toMap() => {
        "fre_id": freId,
        "fre_grados_refrigerador": freGradosRefrigerador,
        "fre_grados_congelador": freGradosCongelador,
    };
}
