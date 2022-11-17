import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyectoflutterapp/models/models.dart';
import 'package:http/http.dart' as http;

class PoiService extends ChangeNotifier {
  final String _baseUrl = 'appflutter-e35ac-default-rtdb.firebaseio.com';

  final List<Poi> poi = [];
  late Poi selectPoi;
  bool isLoading = true;

  PoiService() {
    this.loadPoi();
  }

  Future<List<Poi>> loadPoi() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'PuntoInterrs.json');
    final resp = await http.get(url);

    final Map<String, dynamic> poiMap = json.decode(resp.body);
    poiMap.forEach((key, value) {
      final tempPoi = Poi.fromMap(value);
      tempPoi.id = key;
      this.poi.add(tempPoi);
    });

    this.isLoading = false;
    notifyListeners();
    return this.poi;
  }
}
