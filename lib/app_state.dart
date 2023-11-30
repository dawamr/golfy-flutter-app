import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _accessToken =
          await secureStorage.getString('ff_accessToken') ?? _accessToken;
    });
    await _safeInitAsync(() async {
      _meName = await secureStorage.getString('ff_meName') ?? _meName;
    });
    await _safeInitAsync(() async {
      _meLocation =
          await secureStorage.getString('ff_meLocation') ?? _meLocation;
    });
    await _safeInitAsync(() async {
      _meAvatar = await secureStorage.getString('ff_meAvatar') ?? _meAvatar;
    });
    await _safeInitAsync(() async {
      _meEmail = await secureStorage.getString('ff_meEmail') ?? _meEmail;
    });
    await _safeInitAsync(() async {
      _firstOnboarding =
          await secureStorage.getBool('ff_firstOnboarding') ?? _firstOnboarding;
    });
    await _safeInitAsync(() async {
      _refreshToken =
          await secureStorage.getString('ff_refreshToken') ?? _refreshToken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _accessToken = 'g1XUlV2EaBxJG2jvSuu6jaikdXGRjt9m';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
    secureStorage.setString('ff_accessToken', value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  String _meName = '';
  String get meName => _meName;
  set meName(String value) {
    _meName = value;
    secureStorage.setString('ff_meName', value);
  }

  void deleteMeName() {
    secureStorage.delete(key: 'ff_meName');
  }

  String _meLocation = '';
  String get meLocation => _meLocation;
  set meLocation(String value) {
    _meLocation = value;
    secureStorage.setString('ff_meLocation', value);
  }

  void deleteMeLocation() {
    secureStorage.delete(key: 'ff_meLocation');
  }

  String _meAvatar = '';
  String get meAvatar => _meAvatar;
  set meAvatar(String value) {
    _meAvatar = value;
    secureStorage.setString('ff_meAvatar', value);
  }

  void deleteMeAvatar() {
    secureStorage.delete(key: 'ff_meAvatar');
  }

  String _meEmail = '';
  String get meEmail => _meEmail;
  set meEmail(String value) {
    _meEmail = value;
    secureStorage.setString('ff_meEmail', value);
  }

  void deleteMeEmail() {
    secureStorage.delete(key: 'ff_meEmail');
  }

  bool _firstOnboarding = false;
  bool get firstOnboarding => _firstOnboarding;
  set firstOnboarding(bool value) {
    _firstOnboarding = value;
    secureStorage.setBool('ff_firstOnboarding', value);
  }

  void deleteFirstOnboarding() {
    secureStorage.delete(key: 'ff_firstOnboarding');
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    secureStorage.setString('ff_refreshToken', value);
  }

  void deleteRefreshToken() {
    secureStorage.delete(key: 'ff_refreshToken');
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
