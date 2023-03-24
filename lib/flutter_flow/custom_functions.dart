import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
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

List<LatLng> listStringToLatLng(List<String> stringsLatLng) {
  List<LatLng> latLngs = [];
  for (String str in stringsLatLng) {
    List<String> parts = str.split(',');
    double lat = double.parse(parts[0]);
    double lng = double.parse(parts[1]);
    latLngs.add(LatLng(lat, lng));
  }
  return latLngs;
}
