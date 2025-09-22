import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "mainGoal" field.
  String? _mainGoal;
  String get mainGoal => _mainGoal ?? '';
  bool hasMainGoal() => _mainGoal != null;

  // "specificDiet" field.
  String? _specificDiet;
  String get specificDiet => _specificDiet ?? '';
  bool hasSpecificDiet() => _specificDiet != null;

  // "sugarIssues" field.
  String? _sugarIssues;
  String get sugarIssues => _sugarIssues ?? '';
  bool hasSugarIssues() => _sugarIssues != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  bool hasHeight() => _height != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "lastQueryTime" field.
  String? _lastQueryTime;
  String get lastQueryTime => _lastQueryTime ?? '';
  bool hasLastQueryTime() => _lastQueryTime != null;

  // "noOfQueries" field.
  int? _noOfQueries;
  int get noOfQueries => _noOfQueries ?? 0;
  bool hasNoOfQueries() => _noOfQueries != null;

  // "lifetimeQueries" field.
  int? _lifetimeQueries;
  int get lifetimeQueries => _lifetimeQueries ?? 0;
  bool hasLifetimeQueries() => _lifetimeQueries != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _mainGoal = snapshotData['mainGoal'] as String?;
    _specificDiet = snapshotData['specificDiet'] as String?;
    _sugarIssues = snapshotData['sugarIssues'] as String?;
    _height = snapshotData['height'] as String?;
    _weight = snapshotData['weight'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _gender = snapshotData['gender'] as String?;
    _isPaid = snapshotData['isPaid'] as bool?;
    _lastQueryTime = snapshotData['lastQueryTime'] as String?;
    _noOfQueries = castToType<int>(snapshotData['noOfQueries']);
    _lifetimeQueries = castToType<int>(snapshotData['lifetimeQueries']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? mainGoal,
  String? specificDiet,
  String? sugarIssues,
  String? height,
  String? weight,
  int? age,
  String? gender,
  bool? isPaid,
  String? lastQueryTime,
  int? noOfQueries,
  int? lifetimeQueries,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'mainGoal': mainGoal,
      'specificDiet': specificDiet,
      'sugarIssues': sugarIssues,
      'height': height,
      'weight': weight,
      'age': age,
      'gender': gender,
      'isPaid': isPaid,
      'lastQueryTime': lastQueryTime,
      'noOfQueries': noOfQueries,
      'lifetimeQueries': lifetimeQueries,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.mainGoal == e2?.mainGoal &&
        e1?.specificDiet == e2?.specificDiet &&
        e1?.sugarIssues == e2?.sugarIssues &&
        e1?.height == e2?.height &&
        e1?.weight == e2?.weight &&
        e1?.age == e2?.age &&
        e1?.gender == e2?.gender &&
        e1?.isPaid == e2?.isPaid &&
        e1?.lastQueryTime == e2?.lastQueryTime &&
        e1?.noOfQueries == e2?.noOfQueries &&
        e1?.lifetimeQueries == e2?.lifetimeQueries;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.mainGoal,
        e?.specificDiet,
        e?.sugarIssues,
        e?.height,
        e?.weight,
        e?.age,
        e?.gender,
        e?.isPaid,
        e?.lastQueryTime,
        e?.noOfQueries,
        e?.lifetimeQueries
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
