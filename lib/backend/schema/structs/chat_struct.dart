// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends FFFirebaseStruct {
  ChatStruct({
    DateTime? time,
    List<ChatCompStruct>? chatsContent,
    String? chatID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _chatsContent = chatsContent,
        _chatID = chatID,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "chatsContent" field.
  List<ChatCompStruct>? _chatsContent;
  List<ChatCompStruct> get chatsContent => _chatsContent ?? const [];
  set chatsContent(List<ChatCompStruct>? val) => _chatsContent = val;

  void updateChatsContent(Function(List<ChatCompStruct>) updateFn) {
    updateFn(_chatsContent ??= []);
  }

  bool hasChatsContent() => _chatsContent != null;

  // "chatID" field.
  String? _chatID;
  String get chatID => _chatID ?? '';
  set chatID(String? val) => _chatID = val;

  bool hasChatID() => _chatID != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        time: data['time'] as DateTime?,
        chatsContent: getStructList(
          data['chatsContent'],
          ChatCompStruct.fromMap,
        ),
        chatID: data['chatID'] as String?,
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'chatsContent': _chatsContent?.map((e) => e.toMap()).toList(),
        'chatID': _chatID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'chatsContent': serializeParam(
          _chatsContent,
          ParamType.DataStruct,
          isList: true,
        ),
        'chatID': serializeParam(
          _chatID,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        chatsContent: deserializeStructParam<ChatCompStruct>(
          data['chatsContent'],
          ParamType.DataStruct,
          true,
          structBuilder: ChatCompStruct.fromSerializableMap,
        ),
        chatID: deserializeParam(
          data['chatID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatStruct &&
        time == other.time &&
        listEquality.equals(chatsContent, other.chatsContent) &&
        chatID == other.chatID;
  }

  @override
  int get hashCode => const ListEquality().hash([time, chatsContent, chatID]);
}

ChatStruct createChatStruct({
  DateTime? time,
  String? chatID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatStruct(
      time: time,
      chatID: chatID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatStruct? updateChatStruct(
  ChatStruct? chat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatStructData(
  Map<String, dynamic> firestoreData,
  ChatStruct? chat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chat == null) {
    return;
  }
  if (chat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && chat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatData = getChatFirestoreData(chat, forFieldValue);
  final nestedData = chatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatFirestoreData(
  ChatStruct? chat, [
  bool forFieldValue = false,
]) {
  if (chat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chat.toMap());

  // Add any Firestore field values
  chat.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatListFirestoreData(
  List<ChatStruct>? chats,
) =>
    chats?.map((e) => getChatFirestoreData(e, true)).toList() ?? [];
