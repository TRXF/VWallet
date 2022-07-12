// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userTitle;
    if (value != null) {
      result
        ..add('userTitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vagaWallet;
    if (value != null) {
      result
        ..add('vaga_wallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bscWallet;
    if (value != null) {
      result
        ..add('bsc_wallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.xrplWallet;
    if (value != null) {
      result
        ..add('xrpl_wallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'userTitle':
          result.userTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vaga_wallet':
          result.vagaWallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bsc_wallet':
          result.bscWallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'xrpl_wallet':
          result.xrplWallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String uid;
  @override
  final int age;
  @override
  final LatLng location;
  @override
  final String phoneNumber;
  @override
  final String photoUrl;
  @override
  final DateTime createdTime;
  @override
  final String userTitle;
  @override
  final String vagaWallet;
  @override
  final String bscWallet;
  @override
  final String xrplWallet;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.displayName,
      this.email,
      this.password,
      this.uid,
      this.age,
      this.location,
      this.phoneNumber,
      this.photoUrl,
      this.createdTime,
      this.userTitle,
      this.vagaWallet,
      this.bscWallet,
      this.xrplWallet,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        displayName == other.displayName &&
        email == other.email &&
        password == other.password &&
        uid == other.uid &&
        age == other.age &&
        location == other.location &&
        phoneNumber == other.phoneNumber &&
        photoUrl == other.photoUrl &&
        createdTime == other.createdTime &&
        userTitle == other.userTitle &&
        vagaWallet == other.vagaWallet &&
        bscWallet == other.bscWallet &&
        xrplWallet == other.xrplWallet &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            0,
                                                            displayName
                                                                .hashCode),
                                                        email.hashCode),
                                                    password.hashCode),
                                                uid.hashCode),
                                            age.hashCode),
                                        location.hashCode),
                                    phoneNumber.hashCode),
                                photoUrl.hashCode),
                            createdTime.hashCode),
                        userTitle.hashCode),
                    vagaWallet.hashCode),
                bscWallet.hashCode),
            xrplWallet.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('displayName', displayName)
          ..add('email', email)
          ..add('password', password)
          ..add('uid', uid)
          ..add('age', age)
          ..add('location', location)
          ..add('phoneNumber', phoneNumber)
          ..add('photoUrl', photoUrl)
          ..add('createdTime', createdTime)
          ..add('userTitle', userTitle)
          ..add('vagaWallet', vagaWallet)
          ..add('bscWallet', bscWallet)
          ..add('xrplWallet', xrplWallet)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  int _age;
  int get age => _$this._age;
  set age(int age) => _$this._age = age;

  LatLng _location;
  LatLng get location => _$this._location;
  set location(LatLng location) => _$this._location = location;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _userTitle;
  String get userTitle => _$this._userTitle;
  set userTitle(String userTitle) => _$this._userTitle = userTitle;

  String _vagaWallet;
  String get vagaWallet => _$this._vagaWallet;
  set vagaWallet(String vagaWallet) => _$this._vagaWallet = vagaWallet;

  String _bscWallet;
  String get bscWallet => _$this._bscWallet;
  set bscWallet(String bscWallet) => _$this._bscWallet = bscWallet;

  String _xrplWallet;
  String get xrplWallet => _$this._xrplWallet;
  set xrplWallet(String xrplWallet) => _$this._xrplWallet = xrplWallet;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _email = $v.email;
      _password = $v.password;
      _uid = $v.uid;
      _age = $v.age;
      _location = $v.location;
      _phoneNumber = $v.phoneNumber;
      _photoUrl = $v.photoUrl;
      _createdTime = $v.createdTime;
      _userTitle = $v.userTitle;
      _vagaWallet = $v.vagaWallet;
      _bscWallet = $v.bscWallet;
      _xrplWallet = $v.xrplWallet;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            displayName: displayName,
            email: email,
            password: password,
            uid: uid,
            age: age,
            location: location,
            phoneNumber: phoneNumber,
            photoUrl: photoUrl,
            createdTime: createdTime,
            userTitle: userTitle,
            vagaWallet: vagaWallet,
            bscWallet: bscWallet,
            xrplWallet: xrplWallet,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
