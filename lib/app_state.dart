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
    _hasBeenPressed1 = prefs.getBool('ff_hasBeenPressed1') ?? _hasBeenPressed1;
    _hasBeenPressed2 = prefs.getBool('ff_hasBeenPressed2') ?? _hasBeenPressed2;
    _hasBeenPressed3 = prefs.getBool('ff_hasBeenPressed3') ?? _hasBeenPressed3;
    _hasBeenPressed4 = prefs.getBool('ff_hasBeenPressed4') ?? _hasBeenPressed4;
    _hasBeenPressed5 = prefs.getBool('ff_hasBeenPressed5') ?? _hasBeenPressed5;
    _English = prefs.getString('ff_English') ?? _English;
    _Russian = prefs.getString('ff_Russian') ?? _Russian;
    _Spanish = prefs.getString('ff_Spanish') ?? _Spanish;
    _Japanese = prefs.getString('ff_Japanese') ?? _Japanese;
    _Arabic = prefs.getString('ff_Arabic') ?? _Arabic;
    _Languages = prefs.getStringList('ff_Languages') ?? _Languages;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _aa = DateTime.fromMillisecondsSinceEpoch(1670068980000);
  DateTime? get aa => _aa;
  set aa(DateTime? _value) {
    _aa = _value;
  }

  bool _hasBeenPressed1 = false;
  bool get hasBeenPressed1 => _hasBeenPressed1;
  set hasBeenPressed1(bool _value) {
    _hasBeenPressed1 = _value;
    prefs.setBool('ff_hasBeenPressed1', _value);
  }

  bool _hasBeenPressed2 = false;
  bool get hasBeenPressed2 => _hasBeenPressed2;
  set hasBeenPressed2(bool _value) {
    _hasBeenPressed2 = _value;
    prefs.setBool('ff_hasBeenPressed2', _value);
  }

  bool _hasBeenPressed3 = false;
  bool get hasBeenPressed3 => _hasBeenPressed3;
  set hasBeenPressed3(bool _value) {
    _hasBeenPressed3 = _value;
    prefs.setBool('ff_hasBeenPressed3', _value);
  }

  bool _hasBeenPressed4 = false;
  bool get hasBeenPressed4 => _hasBeenPressed4;
  set hasBeenPressed4(bool _value) {
    _hasBeenPressed4 = _value;
    prefs.setBool('ff_hasBeenPressed4', _value);
  }

  bool _hasBeenPressed5 = false;
  bool get hasBeenPressed5 => _hasBeenPressed5;
  set hasBeenPressed5(bool _value) {
    _hasBeenPressed5 = _value;
    prefs.setBool('ff_hasBeenPressed5', _value);
  }

  String _English = 'English';
  String get English => _English;
  set English(String _value) {
    _English = _value;
    prefs.setString('ff_English', _value);
  }

  String _Russian = 'Русский';
  String get Russian => _Russian;
  set Russian(String _value) {
    _Russian = _value;
    prefs.setString('ff_Russian', _value);
  }

  String _Spanish = 'Español';
  String get Spanish => _Spanish;
  set Spanish(String _value) {
    _Spanish = _value;
    prefs.setString('ff_Spanish', _value);
  }

  String _Japanese = '日本語';
  String get Japanese => _Japanese;
  set Japanese(String _value) {
    _Japanese = _value;
    prefs.setString('ff_Japanese', _value);
  }

  String _Arabic = 'عربي';
  String get Arabic => _Arabic;
  set Arabic(String _value) {
    _Arabic = _value;
    prefs.setString('ff_Arabic', _value);
  }

  List<String> _Languages = ['English', 'Русский', 'Español', '日本語', 'عربي'];
  List<String> get Languages => _Languages;
  set Languages(List<String> _value) {
    _Languages = _value;
    prefs.setStringList('ff_Languages', _value);
  }

  void addToLanguages(String _value) {
    _Languages.add(_value);
    prefs.setStringList('ff_Languages', _Languages);
  }

  void removeFromLanguages(String _value) {
    _Languages.remove(_value);
    prefs.setStringList('ff_Languages', _Languages);
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
