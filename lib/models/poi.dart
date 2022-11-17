// To parse this JSON data, do
//
//     final poi = poiFromMap(jsonString);

import 'dart:convert';



class Poi {
    Poi({
      required this.ciudad,
      required this.departamento,
      required this.descripcion,
      required this.img,
      required this.poi,
      required this.puntuacion,
      required this.temperatura,
      required this.lat,
      required this.log,
      this.id
    });

    String ciudad;
    String departamento;
    String descripcion;
    String img;
    String poi;
    int puntuacion;
    int temperatura;
    double lat;
    double log;
    String? id;

    factory Poi.fromJson(String str) => Poi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Poi.fromMap(Map<String, dynamic> json) => Poi(
        ciudad: json["Ciudad"],
        departamento: json["Departamento"],
        descripcion: json["Descripcion"],
        img: json["Img"],
        poi: json["Poi"],
        puntuacion: json["Puntuacion"],
        temperatura: json["Temperatura"],
        lat: json["lat"].toDouble(),
        log: json["log"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "Ciudad": ciudad,
        "Departamento": departamento,
        "Descripcion": descripcion,
        "Img": img,
        "Poi": poi,
        "Puntuacion": puntuacion,
        "Temperatura": temperatura,
        "lat": lat,
        "log": log,
    };

    Poi copy() => Poi(
      ciudad : this.ciudad,
      departamento : this.departamento,
      descripcion : this.descripcion,
      img : this.img,
      poi : this.poi,
      puntuacion : this.puntuacion,
      temperatura : this.temperatura,
      lat : this.lat,
      log : this.log,
      id : this.id,
    );
}
