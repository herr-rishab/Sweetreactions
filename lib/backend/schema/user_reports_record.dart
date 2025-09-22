import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReportsRecord extends FirestoreRecord {
  UserReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _message = snapshotData['Message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UserReports');

  static Stream<UserReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserReportsRecord.fromSnapshot(s));

  static Future<UserReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserReportsRecord.fromSnapshot(s));

  static UserReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserReportsRecordData({
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserReportsRecordDocumentEquality implements Equality<UserReportsRecord> {
  const UserReportsRecordDocumentEquality();

  @override
  bool equals(UserReportsRecord? e1, UserReportsRecord? e2) {
    return e1?.message == e2?.message;
  }

  @override
  int hash(UserReportsRecord? e) => const ListEquality().hash([e?.message]);

  @override
  bool isValidKey(Object? o) => o is UserReportsRecord;
}
