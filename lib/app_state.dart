import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

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

  late SharedPreferences prefs;

  bool _hasBeenPressed1 = false;
  bool get hasBeenPressed1 => _hasBeenPressed1;
  set hasBeenPressed1(bool _value) {
    notifyListeners();

    _hasBeenPressed1 = _value;
  }

  bool _hasBeenPressed2 = false;
  bool get hasBeenPressed2 => _hasBeenPressed2;
  set hasBeenPressed2(bool _value) {
    notifyListeners();

    _hasBeenPressed2 = _value;
  }

  bool _hasBeenPressed3 = false;
  bool get hasBeenPressed3 => _hasBeenPressed3;
  set hasBeenPressed3(bool _value) {
    notifyListeners();

    _hasBeenPressed3 = _value;
  }

  bool _hasBeenPressed4 = false;
  bool get hasBeenPressed4 => _hasBeenPressed4;
  set hasBeenPressed4(bool _value) {
    notifyListeners();

    _hasBeenPressed4 = _value;
  }

  bool _hasBeenPressed5 = false;
  bool get hasBeenPressed5 => _hasBeenPressed5;
  set hasBeenPressed5(bool _value) {
    notifyListeners();

    _hasBeenPressed5 = _value;
  }

  DateTime? _aa = DateTime.fromMillisecondsSinceEpoch(1670068980000);
  DateTime? get aa => _aa;
  set aa(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _aa = _value;
  }

  String _phone = '+7-707-396-3155';
  String get phone => _phone;
  set phone(String _value) {
    notifyListeners();

    _phone = _value;
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
