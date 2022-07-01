import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'snapshot_record.g.dart';

abstract class SnapshotRecord
    implements Built<SnapshotRecord, SnapshotRecordBuilder> {
  static Serializer<SnapshotRecord> get serializer =>
      _$snapshotRecordSerializer;

  @nullable
  String get address;

  @nullable
  String get balance;

  @nullable
  String get reward;

  @nullable
  String get timeStamp;

  @nullable
  String get token;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(SnapshotRecordBuilder builder) => builder
    ..address = ''
    ..balance = ''
    ..reward = ''
    ..timeStamp = ''
    ..token = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('snapshot')
          : FirebaseFirestore.instance.collectionGroup('snapshot');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('snapshot').doc();

  static Stream<SnapshotRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SnapshotRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SnapshotRecord._();
  factory SnapshotRecord([void Function(SnapshotRecordBuilder) updates]) =
      _$SnapshotRecord;

  static SnapshotRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSnapshotRecordData({
  String address,
  String balance,
  String reward,
  String timeStamp,
  String token,
}) =>
    serializers.toFirestore(
        SnapshotRecord.serializer,
        SnapshotRecord((s) => s
          ..address = address
          ..balance = balance
          ..reward = reward
          ..timeStamp = timeStamp
          ..token = token));
