import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _hasBeenPressed1 =
        await secureStorage.getBool('ff_hasBeenPressed1') ?? _hasBeenPressed1;
    _hasBeenPressed2 =
        await secureStorage.getBool('ff_hasBeenPressed2') ?? _hasBeenPressed2;
    _hasBeenPressed3 =
        await secureStorage.getBool('ff_hasBeenPressed3') ?? _hasBeenPressed3;
    _hasBeenPressed4 =
        await secureStorage.getBool('ff_hasBeenPressed4') ?? _hasBeenPressed4;
    _hasBeenPressed5 =
        await secureStorage.getBool('ff_hasBeenPressed5') ?? _hasBeenPressed5;
    _English = await secureStorage.getString('ff_English') ?? _English;
    _Russian = await secureStorage.getString('ff_Russian') ?? _Russian;
    _Spanish = await secureStorage.getString('ff_Spanish') ?? _Spanish;
    _Japanese = await secureStorage.getString('ff_Japanese') ?? _Japanese;
    _Arabic = await secureStorage.getString('ff_Arabic') ?? _Arabic;
    _Languages =
        await secureStorage.getStringList('ff_Languages') ?? _Languages;
    _pinput = await secureStorage.getInt('ff_pinput') ?? _pinput;
    _Image = (await secureStorage.getStringList('ff_Image')) ?? _Image;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DateTime? aa = DateTime.fromMillisecondsSinceEpoch(1670068980000);

  bool _hasBeenPressed1 = false;
  bool get hasBeenPressed1 => _hasBeenPressed1;
  set hasBeenPressed1(bool _value) {
    _hasBeenPressed1 = _value;
    secureStorage.setBool('ff_hasBeenPressed1', _value);
  }

  void deleteHasBeenPressed1() {
    secureStorage.delete(key: 'ff_hasBeenPressed1');
  }

  bool _hasBeenPressed2 = false;
  bool get hasBeenPressed2 => _hasBeenPressed2;
  set hasBeenPressed2(bool _value) {
    _hasBeenPressed2 = _value;
    secureStorage.setBool('ff_hasBeenPressed2', _value);
  }

  void deleteHasBeenPressed2() {
    secureStorage.delete(key: 'ff_hasBeenPressed2');
  }

  bool _hasBeenPressed3 = false;
  bool get hasBeenPressed3 => _hasBeenPressed3;
  set hasBeenPressed3(bool _value) {
    _hasBeenPressed3 = _value;
    secureStorage.setBool('ff_hasBeenPressed3', _value);
  }

  void deleteHasBeenPressed3() {
    secureStorage.delete(key: 'ff_hasBeenPressed3');
  }

  bool _hasBeenPressed4 = false;
  bool get hasBeenPressed4 => _hasBeenPressed4;
  set hasBeenPressed4(bool _value) {
    _hasBeenPressed4 = _value;
    secureStorage.setBool('ff_hasBeenPressed4', _value);
  }

  void deleteHasBeenPressed4() {
    secureStorage.delete(key: 'ff_hasBeenPressed4');
  }

  bool _hasBeenPressed5 = false;
  bool get hasBeenPressed5 => _hasBeenPressed5;
  set hasBeenPressed5(bool _value) {
    _hasBeenPressed5 = _value;
    secureStorage.setBool('ff_hasBeenPressed5', _value);
  }

  void deleteHasBeenPressed5() {
    secureStorage.delete(key: 'ff_hasBeenPressed5');
  }

  String _English = 'English';
  String get English => _English;
  set English(String _value) {
    _English = _value;
    secureStorage.setString('ff_English', _value);
  }

  void deleteEnglish() {
    secureStorage.delete(key: 'ff_English');
  }

  String _Russian = 'Русский';
  String get Russian => _Russian;
  set Russian(String _value) {
    _Russian = _value;
    secureStorage.setString('ff_Russian', _value);
  }

  void deleteRussian() {
    secureStorage.delete(key: 'ff_Russian');
  }

  String _Spanish = 'Español';
  String get Spanish => _Spanish;
  set Spanish(String _value) {
    _Spanish = _value;
    secureStorage.setString('ff_Spanish', _value);
  }

  void deleteSpanish() {
    secureStorage.delete(key: 'ff_Spanish');
  }

  String _Japanese = '日本語';
  String get Japanese => _Japanese;
  set Japanese(String _value) {
    _Japanese = _value;
    secureStorage.setString('ff_Japanese', _value);
  }

  void deleteJapanese() {
    secureStorage.delete(key: 'ff_Japanese');
  }

  String _Arabic = 'عربي';
  String get Arabic => _Arabic;
  set Arabic(String _value) {
    _Arabic = _value;
    secureStorage.setString('ff_Arabic', _value);
  }

  void deleteArabic() {
    secureStorage.delete(key: 'ff_Arabic');
  }

  List<String> _Languages = ['English', 'Русский', 'Español', '日本語', 'عربي'];
  List<String> get Languages => _Languages;
  set Languages(List<String> _value) {
    _Languages = _value;
    secureStorage.setStringList('ff_Languages', _value);
  }

  void deleteLanguages() {
    secureStorage.delete(key: 'ff_Languages');
  }

  void addToLanguages(String _value) {
    _Languages.add(_value);
    secureStorage.setStringList('ff_Languages', _Languages);
  }

  void removeFromLanguages(String _value) {
    _Languages.remove(_value);
    secureStorage.setStringList('ff_Languages', _Languages);
  }

  int _pinput = 123456;
  int get pinput => _pinput;
  set pinput(int _value) {
    _pinput = _value;
    secureStorage.setInt('ff_pinput', _value);
  }

  void deletePinput() {
    secureStorage.delete(key: 'ff_pinput');
  }

  List<String> _Image = [
    'https://picsum.photos/seed/163/600',
    'https://picsum.photos/seed/583/600',
    'https://picsum.photos/seed/263/600'
  ];
  List<String> get Image => _Image;
  set Image(List<String> _value) {
    _Image = _value;
    secureStorage.setStringList('ff_Image', _value);
  }

  void deleteImage() {
    secureStorage.delete(key: 'ff_Image');
  }

  void addToImage(String _value) {
    _Image.add(_value);
    secureStorage.setStringList('ff_Image', _Image);
  }

  void removeFromImage(String _value) {
    _Image.remove(_value);
    secureStorage.setStringList('ff_Image', _Image);
  }
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
