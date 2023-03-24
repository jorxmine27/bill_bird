import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _IsOff = false;
  bool get IsOff => _IsOff;
  set IsOff(bool _value) {
    _IsOff = _value;
  }

  String _birdname = '';
  String get birdname => _birdname;
  set birdname(String _value) {
    _birdname = _value;
  }

  List<LatLng> _Coordenadas = [LatLng(41.388123, 2.1860152)];
  List<LatLng> get Coordenadas => _Coordenadas;
  set Coordenadas(List<LatLng> _value) {
    _Coordenadas = _value;
  }

  void addToCoordenadas(LatLng _value) {
    _Coordenadas.add(_value);
  }

  void removeFromCoordenadas(LatLng _value) {
    _Coordenadas.remove(_value);
  }

  void removeAtIndexFromCoordenadas(int _index) {
    _Coordenadas.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
