import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  List<ChatCompStruct>? _content;
  List<ChatCompStruct> get content => _content ?? const [];
  bool hasContent() => _content != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "chatID" field.
  String? _chatID;
  String get chatID => _chatID ?? '';
  bool hasChatID() => _chatID != null;

  void _initializeFields() {
    _content = getStructList(
      snapshotData['content'],
      ChatCompStruct.fromMap,
    );
    _time = snapshotData['time'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _chatID = snapshotData['chatID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DateTime? time,
  String? uid,
  String? chatID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
      'uid': uid,
      'chatID': chatID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.content, e2?.content) &&
        e1?.time == e2?.time &&
        e1?.uid == e2?.uid &&
        e1?.chatID == e2?.chatID;
  }

  @override
  int hash(ChatsRecord? e) =>
      const ListEquality().hash([e?.content, e?.time, e?.uid, e?.chatID]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
