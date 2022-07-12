import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vwallet_record.g.dart';

abstract class VwalletRecord
    implements Built<VwalletRecord, VwalletRecordBuilder> {
  static Serializer<VwalletRecord> get serializer => _$vwalletRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'vaga_mnemonic')
  String get vagaMnemonic;

  @nullable
  @BuiltValueField(wireName: 'vaga_pk')
  String get vagaPk;

  @nullable
  String get wallet;

  @nullable
  @BuiltValueField(wireName: 'wallet_mnemonic')
  String get walletMnemonic;

  @nullable
  @BuiltValueField(wireName: 'wallet_pk')
  String get walletPk;

  @nullable
  @BuiltValueField(wireName: 'xrpl_pk')
  String get xrplPk;

  @nullable
  String get vaga;

  @nullable
  @BuiltValueField(wireName: 'xrpl_wallet')
  String get xrplWallet;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(VwalletRecordBuilder builder) => builder
    ..vagaMnemonic = ''
    ..vagaPk = ''
    ..wallet = ''
    ..walletMnemonic = ''
    ..walletPk = ''
    ..xrplPk = ''
    ..vaga = ''
    ..xrplWallet = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('vwallet')
          : FirebaseFirestore.instance.collectionGroup('vwallet');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('vwallet').doc();

  static Stream<VwalletRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VwalletRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VwalletRecord._();
  factory VwalletRecord([void Function(VwalletRecordBuilder) updates]) =
      _$VwalletRecord;

  static VwalletRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVwalletRecordData({
  String vagaMnemonic,
  String vagaPk,
  String wallet,
  String walletMnemonic,
  String walletPk,
  String xrplPk,
  String vaga,
  String xrplWallet,
}) =>
    serializers.toFirestore(
        VwalletRecord.serializer,
        VwalletRecord((v) => v
          ..vagaMnemonic = vagaMnemonic
          ..vagaPk = vagaPk
          ..wallet = wallet
          ..walletMnemonic = walletMnemonic
          ..walletPk = walletPk
          ..xrplPk = xrplPk
          ..vaga = vaga
          ..xrplWallet = xrplWallet));
