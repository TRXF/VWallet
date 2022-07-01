// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vwallet_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VwalletRecord> _$vwalletRecordSerializer =
    new _$VwalletRecordSerializer();

class _$VwalletRecordSerializer implements StructuredSerializer<VwalletRecord> {
  @override
  final Iterable<Type> types = const [VwalletRecord, _$VwalletRecord];
  @override
  final String wireName = 'VwalletRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, VwalletRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.vagaMnemonic;
    if (value != null) {
      result
        ..add('vaga_mnemonic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vagaPk;
    if (value != null) {
      result
        ..add('vaga_pk')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wallet;
    if (value != null) {
      result
        ..add('wallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.walletMnemonic;
    if (value != null) {
      result
        ..add('wallet_mnemonic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.walletPk;
    if (value != null) {
      result
        ..add('wallet_pk')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.xrplPk;
    if (value != null) {
      result
        ..add('xrpl_pk')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vaga;
    if (value != null) {
      result
        ..add('vaga')
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
  VwalletRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VwalletRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'vaga_mnemonic':
          result.vagaMnemonic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vaga_pk':
          result.vagaPk = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet':
          result.wallet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_mnemonic':
          result.walletMnemonic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_pk':
          result.walletPk = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'xrpl_pk':
          result.xrplPk = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vaga':
          result.vaga = serializers.deserialize(value,
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

class _$VwalletRecord extends VwalletRecord {
  @override
  final String vagaMnemonic;
  @override
  final String vagaPk;
  @override
  final String wallet;
  @override
  final String walletMnemonic;
  @override
  final String walletPk;
  @override
  final String xrplPk;
  @override
  final String vaga;
  @override
  final String xrplWallet;
  @override
  final DocumentReference<Object> reference;

  factory _$VwalletRecord([void Function(VwalletRecordBuilder) updates]) =>
      (new VwalletRecordBuilder()..update(updates)).build();

  _$VwalletRecord._(
      {this.vagaMnemonic,
      this.vagaPk,
      this.wallet,
      this.walletMnemonic,
      this.walletPk,
      this.xrplPk,
      this.vaga,
      this.xrplWallet,
      this.reference})
      : super._();

  @override
  VwalletRecord rebuild(void Function(VwalletRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VwalletRecordBuilder toBuilder() => new VwalletRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VwalletRecord &&
        vagaMnemonic == other.vagaMnemonic &&
        vagaPk == other.vagaPk &&
        wallet == other.wallet &&
        walletMnemonic == other.walletMnemonic &&
        walletPk == other.walletPk &&
        xrplPk == other.xrplPk &&
        vaga == other.vaga &&
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
                                $jc($jc(0, vagaMnemonic.hashCode),
                                    vagaPk.hashCode),
                                wallet.hashCode),
                            walletMnemonic.hashCode),
                        walletPk.hashCode),
                    xrplPk.hashCode),
                vaga.hashCode),
            xrplWallet.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VwalletRecord')
          ..add('vagaMnemonic', vagaMnemonic)
          ..add('vagaPk', vagaPk)
          ..add('wallet', wallet)
          ..add('walletMnemonic', walletMnemonic)
          ..add('walletPk', walletPk)
          ..add('xrplPk', xrplPk)
          ..add('vaga', vaga)
          ..add('xrplWallet', xrplWallet)
          ..add('reference', reference))
        .toString();
  }
}

class VwalletRecordBuilder
    implements Builder<VwalletRecord, VwalletRecordBuilder> {
  _$VwalletRecord _$v;

  String _vagaMnemonic;
  String get vagaMnemonic => _$this._vagaMnemonic;
  set vagaMnemonic(String vagaMnemonic) => _$this._vagaMnemonic = vagaMnemonic;

  String _vagaPk;
  String get vagaPk => _$this._vagaPk;
  set vagaPk(String vagaPk) => _$this._vagaPk = vagaPk;

  String _wallet;
  String get wallet => _$this._wallet;
  set wallet(String wallet) => _$this._wallet = wallet;

  String _walletMnemonic;
  String get walletMnemonic => _$this._walletMnemonic;
  set walletMnemonic(String walletMnemonic) =>
      _$this._walletMnemonic = walletMnemonic;

  String _walletPk;
  String get walletPk => _$this._walletPk;
  set walletPk(String walletPk) => _$this._walletPk = walletPk;

  String _xrplPk;
  String get xrplPk => _$this._xrplPk;
  set xrplPk(String xrplPk) => _$this._xrplPk = xrplPk;

  String _vaga;
  String get vaga => _$this._vaga;
  set vaga(String vaga) => _$this._vaga = vaga;

  String _xrplWallet;
  String get xrplWallet => _$this._xrplWallet;
  set xrplWallet(String xrplWallet) => _$this._xrplWallet = xrplWallet;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  VwalletRecordBuilder() {
    VwalletRecord._initializeBuilder(this);
  }

  VwalletRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vagaMnemonic = $v.vagaMnemonic;
      _vagaPk = $v.vagaPk;
      _wallet = $v.wallet;
      _walletMnemonic = $v.walletMnemonic;
      _walletPk = $v.walletPk;
      _xrplPk = $v.xrplPk;
      _vaga = $v.vaga;
      _xrplWallet = $v.xrplWallet;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VwalletRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VwalletRecord;
  }

  @override
  void update(void Function(VwalletRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VwalletRecord build() {
    final _$result = _$v ??
        new _$VwalletRecord._(
            vagaMnemonic: vagaMnemonic,
            vagaPk: vagaPk,
            wallet: wallet,
            walletMnemonic: walletMnemonic,
            walletPk: walletPk,
            xrplPk: xrplPk,
            vaga: vaga,
            xrplWallet: xrplWallet,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
