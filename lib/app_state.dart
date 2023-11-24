import 'package:flutter/material.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
  }

  String _meName = '';
  String get meName => _meName;
  set meName(String value) {
    _meName = value;
  }

  String _meLocation = '';
  String get meLocation => _meLocation;
  set meLocation(String value) {
    _meLocation = value;
  }

  String _meAvatar = '';
  String get meAvatar => _meAvatar;
  set meAvatar(String value) {
    _meAvatar = value;
  }

  String _meEmail = '';
  String get meEmail => _meEmail;
  set meEmail(String value) {
    _meEmail = value;
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
