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
    _password = prefs.getString('ff_password') ?? _password;
    _mnemonic = prefs.getString('ff_mnemonic') ?? _mnemonic;
    _privatekey = prefs.getString('ff_privatekey') ?? _privatekey;
  }

  SharedPreferences prefs;

  String _password = '';
  String get password => _password;
  set password(String _value) {
    _password = _value;
    prefs.setString('ff_password', _value);
  }

  String uid = '';

  String _mnemonic = '';
  String get mnemonic => _mnemonic;
  set mnemonic(String _value) {
    _mnemonic = _value;
    prefs.setString('ff_mnemonic', _value);
  }

  String _privatekey = '';
  String get privatekey => _privatekey;
  set privatekey(String _value) {
    _privatekey = _value;
    prefs.setString('ff_privatekey', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
