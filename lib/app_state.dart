import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cartitems = prefs.getInt('ff_cartitems') ?? _cartitems;
    });
    _safeInit(() {
      _phoneno = prefs.getInt('ff_phoneno') ?? _phoneno;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _cartitems = 0;
  int get cartitems => _cartitems;
  set cartitems(int _value) {
    _cartitems = _value;
    prefs.setInt('ff_cartitems', _value);
  }

  int _phoneno = 0;
  int get phoneno => _phoneno;
  set phoneno(int _value) {
    _phoneno = _value;
    prefs.setInt('ff_phoneno', _value);
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
