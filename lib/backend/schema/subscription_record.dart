import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionRecord extends FirestoreRecord {
  SubscriptionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "paidMonthlyQueries" field.
  int? _paidMonthlyQueries;
  int get paidMonthlyQueries => _paidMonthlyQueries ?? 0;
  bool hasPaidMonthlyQueries() => _paidMonthlyQueries != null;

  // "freeDailyQueries" field.
  int? _freeDailyQueries;
  int get freeDailyQueries => _freeDailyQueries ?? 0;
  bool hasFreeDailyQueries() => _freeDailyQueries != null;

  // "softPaidMonthlyQueries" field.
  int? _softPaidMonthlyQueries;
  int get softPaidMonthlyQueries => _softPaidMonthlyQueries ?? 0;
  bool hasSoftPaidMonthlyQueries() => _softPaidMonthlyQueries != null;

  // "freeLifetimeQueries" field.
  int? _freeLifetimeQueries;
  int get freeLifetimeQueries => _freeLifetimeQueries ?? 0;
  bool hasFreeLifetimeQueries() => _freeLifetimeQueries != null;

  void _initializeFields() {
    _paidMonthlyQueries = castToType<int>(snapshotData['paidMonthlyQueries']);
    _freeDailyQueries = castToType<int>(snapshotData['freeDailyQueries']);
    _softPaidMonthlyQueries =
        castToType<int>(snapshotData['softPaidMonthlyQueries']);
    _freeLifetimeQueries = castToType<int>(snapshotData['freeLifetimeQueries']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscription');

  static Stream<SubscriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionRecord.fromSnapshot(s));

  static Future<SubscriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionRecord.fromSnapshot(s));

  static SubscriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionRecordData({
  int? paidMonthlyQueries,
  int? freeDailyQueries,
  int? softPaidMonthlyQueries,
  int? freeLifetimeQueries,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'paidMonthlyQueries': paidMonthlyQueries,
      'freeDailyQueries': freeDailyQueries,
      'softPaidMonthlyQueries': softPaidMonthlyQueries,
      'freeLifetimeQueries': freeLifetimeQueries,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionRecordDocumentEquality
    implements Equality<SubscriptionRecord> {
  const SubscriptionRecordDocumentEquality();

  @override
  bool equals(SubscriptionRecord? e1, SubscriptionRecord? e2) {
    return e1?.paidMonthlyQueries == e2?.paidMonthlyQueries &&
        e1?.freeDailyQueries == e2?.freeDailyQueries &&
        e1?.softPaidMonthlyQueries == e2?.softPaidMonthlyQueries &&
        e1?.freeLifetimeQueries == e2?.freeLifetimeQueries;
  }

  @override
  int hash(SubscriptionRecord? e) => const ListEquality().hash([
        e?.paidMonthlyQueries,
        e?.freeDailyQueries,
        e?.softPaidMonthlyQueries,
        e?.freeLifetimeQueries
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionRecord;
}
