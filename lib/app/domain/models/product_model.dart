
import 'dart:convert';

import 'package:freezer_products/app/domain/models/freezer_model.dart';

class ProductoModel {
    ProductoModel({
        required this.proId,
        required this.proNombre,
        required this.proCantidad,
        this.proUnidad,
        required this.proUbicacion,
        required this.proRecordatorio,
        required this.proImagen,
        required this.proFechaVencimiento,
        required this.proFechaIngreso,
        required this.freezer,
    });

    int proId;
    String proNombre;
    double proCantidad;
    String? proUnidad;
    String proUbicacion;
    bool proRecordatorio;
    String proImagen;
    DateTime proFechaVencimiento;
    DateTime proFechaIngreso;
    FreezerModel freezer;

    factory ProductoModel.fromJson(String str) => ProductoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductoModel.fromMap(Map<String, dynamic> json) => ProductoModel(
        proId: json["pro_id"],
        proNombre: json["pro_nombre"],
        proCantidad: json["pro_cantidad"].toDouble() ?? 0.0,
        proUnidad: json["pro_unidad"] ?? "",
        proUbicacion: json["pro_ubicacion"],
        proRecordatorio: json["pro_recordatorio"],
        proImagen: json["pro_imagen"],
        proFechaVencimiento: DateTime.parse(json["pro_fecha_vencimiento"]),
        proFechaIngreso: DateTime.parse(json["pro_fecha_ingreso"]),
        freezer: FreezerModel.fromMap(json["freezer"]),
    );

    Map<String, dynamic> toMap() => {
        "pro_id": proId,
        "pro_nombre": proNombre,
        "pro_cantidad": proCantidad,
        "pro_unidad": proUnidad == null ? null : proUnidad,
        "pro_ubicacion": proUbicacion,
        "pro_recordatorio": proRecordatorio,
        "pro_imagen": proImagen,
        "pro_fecha_vencimiento": proFechaVencimiento.toIso8601String(),
        "pro_fecha_ingreso": proFechaIngreso.toIso8601String(),
        "freezer": freezer.toMap(),
    };
}

