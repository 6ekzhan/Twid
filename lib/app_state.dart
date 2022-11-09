import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
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

  bool hasBeenPressed1 = false;

  bool hasBeenPressed2 = false;

  bool hasBeenPressed3 = false;

  bool hasBeenPressed4 = false;

  bool hasBeenPressed5 = false;

  DateTime? aa = DateTime.fromMillisecondsSinceEpoch(1667424060000);

  String phone = '+7-707-396-3155';
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
