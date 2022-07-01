// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapshot_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SnapshotRecord> _$snapshotRecordSerializer =
    new _$SnapshotRecordSerializer();

class _$SnapshotRecordSerializer
    implements StructuredSerializer<SnapshotRecord> {
  @override
  final Iterable<Type> types = const [SnapshotRecord, _$SnapshotRecord];
  @override
  final String wireName = 'SnapshotRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SnapshotRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reward;
    if (value != null) {
      result
        ..add('reward')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeStamp;
    if (value != null) {
      result
        ..add('timeStamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.token;
    if (value != null) {
      result
        ..add('token')
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
  SnapshotRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SnapshotRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reward':
          result.reward = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timeStamp':
          result.timeStamp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
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

class _$SnapshotRecord extends SnapshotRecord {
  @override
  final String address;
  @override
  final String balance;
  @override
  final String reward;
  @override
  final String timeStamp;
  @override
  final String token;
  @override
  final DocumentReference<Object> reference;

  factory _$SnapshotRecord([void Function(SnapshotRecordBuilder) updates]) =>
      (new SnapshotRecordBuilder()..update(updates)).build();

  _$SnapshotRecord._(
      {this.address,
      this.balance,
      this.reward,
      this.timeStamp,
      this.token,
      this.reference})
      : super._();

  @override
  SnapshotRecord rebuild(void Function(SnapshotRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SnapshotRecordBuilder toBuilder() =>
      new SnapshotRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SnapshotRecord &&
        address == other.address &&
        balance == other.balance &&
        reward == other.reward &&
        timeStamp == other.timeStamp &&
        token == other.token &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, address.hashCode), balance.hashCode),
                    reward.hashCode),
                timeStamp.hashCode),
            token.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SnapshotRecord')
          ..add('address', address)
          ..add('balance', balance)
          ..add('reward', reward)
          ..add('timeStamp', timeStamp)
          ..add('token', token)
          ..add('reference', reference))
        .toString();
  }
}

class SnapshotRecordBuilder
    implements Builder<SnapshotRecord, SnapshotRecordBuilder> {
  _$SnapshotRecord _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _balance;
  String get balance => _$this._balance;
  set balance(String balance) => _$this._balance = balance;

  String _reward;
  String get reward => _$this._reward;
  set reward(String reward) => _$this._reward = reward;

  String _timeStamp;
  String get timeStamp => _$this._timeStamp;
  set timeStamp(String timeStamp) => _$this._timeStamp = timeStamp;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SnapshotRecordBuilder() {
    SnapshotRecord._initializeBuilder(this);
  }

  SnapshotRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _balance = $v.balance;
      _reward = $v.reward;
      _timeStamp = $v.timeStamp;
      _token = $v.token;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SnapshotRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SnapshotRecord;
  }

  @override
  void update(void Function(SnapshotRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SnapshotRecord build() {
    final _$result = _$v ??
        new _$SnapshotRecord._(
            address: address,
            balance: balance,
            reward: reward,
            timeStamp: timeStamp,
            token: token,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
