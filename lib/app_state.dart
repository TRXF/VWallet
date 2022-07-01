import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

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
    _mainAddress = prefs.getString('ff_mainAddress') ?? _mainAddress;
    _userData = prefs.getString('ff_userData') ?? _userData;
    _vagaAddress = prefs.getString('ff_vagaAddress') ?? _vagaAddress;
    _vagaMnemonic = prefs.getString('ff_vagaMnemonic') ?? _vagaMnemonic;
    _vagaPrivatekey = prefs.getString('ff_vagaPrivatekey') ?? _vagaPrivatekey;
    _bscAddress = prefs.getString('ff_bscAddress') ?? _bscAddress;
    _bscMnemonic = prefs.getString('ff_bscMnemonic') ?? _bscMnemonic;
    _bscPrivateKey = prefs.getString('ff_bscPrivateKey') ?? _bscPrivateKey;
    _xrplAddress = prefs.getString('ff_xrplAddress') ?? _xrplAddress;
    _xrplPrivatekey = prefs.getString('ff_xrplPrivatekey') ?? _xrplPrivatekey;
    _xrplSeed = prefs.getString('ff_xrplSeed') ?? _xrplSeed;
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

  String type = '';

  String txblob = '';

  String sendto = '';

  String sendamount = '';

  String _mainAddress = '';
  String get mainAddress => _mainAddress;
  set mainAddress(String _value) {
    _mainAddress = _value;
    prefs.setString('ff_mainAddress', _value);
  }

  String _userData = '';
  String get userData => _userData;
  set userData(String _value) {
    _userData = _value;
    prefs.setString('ff_userData', _value);
  }

  String txresult = '';

  String transactionHash = '';

  String gasUsed = '';

  String rawLog = '';

  String balance = '';

  String income = '';

  String spending = '';

  bool privacy = false;

  bool showbscbutton = false;

  bool showxrplbutton = false;

  dynamic xrplwalletcreated;

  String _vagaAddress = '';
  String get vagaAddress => _vagaAddress;
  set vagaAddress(String _value) {
    _vagaAddress = _value;
    prefs.setString('ff_vagaAddress', _value);
  }

  String _vagaMnemonic = '';
  String get vagaMnemonic => _vagaMnemonic;
  set vagaMnemonic(String _value) {
    _vagaMnemonic = _value;
    prefs.setString('ff_vagaMnemonic', _value);
  }

  String _vagaPrivatekey = '';
  String get vagaPrivatekey => _vagaPrivatekey;
  set vagaPrivatekey(String _value) {
    _vagaPrivatekey = _value;
    prefs.setString('ff_vagaPrivatekey', _value);
  }

  String _bscAddress = '';
  String get bscAddress => _bscAddress;
  set bscAddress(String _value) {
    _bscAddress = _value;
    prefs.setString('ff_bscAddress', _value);
  }

  String _bscMnemonic = '';
  String get bscMnemonic => _bscMnemonic;
  set bscMnemonic(String _value) {
    _bscMnemonic = _value;
    prefs.setString('ff_bscMnemonic', _value);
  }

  String _bscPrivateKey = '';
  String get bscPrivateKey => _bscPrivateKey;
  set bscPrivateKey(String _value) {
    _bscPrivateKey = _value;
    prefs.setString('ff_bscPrivateKey', _value);
  }

  String _xrplAddress = '';
  String get xrplAddress => _xrplAddress;
  set xrplAddress(String _value) {
    _xrplAddress = _value;
    prefs.setString('ff_xrplAddress', _value);
  }

  String _xrplPrivatekey = '';
  String get xrplPrivatekey => _xrplPrivatekey;
  set xrplPrivatekey(String _value) {
    _xrplPrivatekey = _value;
    prefs.setString('ff_xrplPrivatekey', _value);
  }

  String _xrplSeed = '';
  String get xrplSeed => _xrplSeed;
  set xrplSeed(String _value) {
    _xrplSeed = _value;
    prefs.setString('ff_xrplSeed', _value);
  }

  List<String> bscmnemoniclist = [];

  bool hasTransaction = false;

  List<String> vagamnemoiclist = [];

  dynamic Zero = jsonDecode('{\"vaga\":0}');
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
