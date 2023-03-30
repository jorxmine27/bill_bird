import 'dart:convert';
import 'dart:math' as math;

import 'package:bill_bird/backend/api_requests/api_calls.dart';
import 'package:json_path/json_path.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'flutter_flow_theme.dart';
import 'lat_lng.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../backend/supabase/supabase.dart';
import '../../auth/auth_util.dart';

bool searchEngineFunction(
  String searchInput,
  String searchFor,
) {
  return searchInput.toLowerCase().contains(searchFor.toLowerCase());
}

LatLng latLngParser(
  String? latitud,
  String? longitud,
) {
  return LatLng(double.parse(latitud!), double.parse(longitud!));
}

List<latLng.LatLng> listStringToLatLng(List<String> stringsLatLng) {
  List<latLng.LatLng> latLngs = [];
  for (String str in stringsLatLng) {
    List<String> parts = str.split(',');
    double lat = double.parse(parts[0]);
    double lng = double.parse(parts[1]);
    latLngs.add(latLng.LatLng(lat, lng));
  }
  return latLngs;
}

List<String> cargarUbicaciones(ApiCallResponse Response) {
  List<dynamic> response = getJsonField(Response.jsonBody, r'''$[:].LatLng''');
  List<String> coordenadas = response.cast<String>();
  return coordenadas;
}

List<Marker> Marcadores(ApiCallResponse Response) {
  List<String> coordenadas = cargarUbicaciones(Response);
  List<latLng.LatLng> parques = listStringToLatLng(coordenadas);
  List<Marker> Marcadores = parques
      .map((coordenada) => Marker(
            point: coordenada,
            width: 60,
            height: 60,
            builder: (context) => Image(
              image: AssetImage('assets/images/billbird.png'),
            )
          ))
      .toList();
  return Marcadores;
}
