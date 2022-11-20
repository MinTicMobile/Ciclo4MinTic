import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:async';
//import 'package:google_maps/google_maps.dart';

import '../models/poi.dart';
import '../services/poi_service.dart';

class PoiLocation extends StatefulWidget {
  final Poi poi;
  const PoiLocation({super.key, required this.poi});

  @override
  State<PoiLocation> createState() => _PoiLocationState();
}

class _PoiLocationState extends State<PoiLocation> {
  late GoogleMapController mapController;

  // final CameraPosition _cartagena = CameraPosition(
  //   //target: LatLng(10.4001987, -75.5085254),
  //   target: LatLng(widget.poi.lat, widget.poi.log),
  //   zoom: 12,
  // );

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId(widget.poi.poi),
        position: LatLng(widget.poi.lat, widget.poi.log),
        infoWindow: InfoWindow(
          title: widget.poi.poi,
        ),
      );
      _markers[widget.poi.poi] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    final poiService = Provider.of<PoiService>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(poiService.selectPoi.poi),
          backgroundColor: const Color.fromRGBO(48, 10, 104, 1)),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.poi.lat, widget.poi.log),
          zoom: 14,
        ),
        onMapCreated: _onMapCreated,
        markers: _markers.values.toSet(),
      ),
    );
  }
}
