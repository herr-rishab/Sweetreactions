// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatCompStruct extends FFFirebaseStruct {
  ChatCompStruct({
    String? userContent,
    String? assistantContent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userContent = userContent,
        _assistantContent = assistantContent,
        super(firestoreUtilData);

  // "userContent" field.
  String? _userContent;
  String get userContent => _userContent ?? '';
  set userContent(String? val) => _userContent = val;

  bool hasUserContent() => _userContent != null;

  // "assistantContent" field.
  String? _assistantContent;
  String get assistantContent => _assistantContent ?? '';
  set assistantContent(String? val) => _assistantContent = val;

  bool hasAssistantContent() => _assistantContent != null;

  static ChatCompStruct fromMap(Map<String, dynamic> data) => ChatCompStruct(
        userContent: data['userContent'] as String?,
        assistantContent: data['assistantContent'] as String?,
      );

  static ChatCompStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatCompStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userContent': _userContent,
        'assistantContent': _assistantContent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userContent': serializeParam(
          _userContent,
          ParamType.String,
        ),
        'assistantContent': serializeParam(
          _assistantContent,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatCompStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatCompStruct(
        userContent: deserializeParam(
          data['userContent'],
          ParamType.String,
          false,
        ),
        assistantContent: deserializeParam(
          data['assistantContent'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatCompStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatCompStruct &&
        userContent == other.userContent &&
        assistantContent == other.assistantContent;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userContent, assistantContent]);
}

ChatCompStruct createChatCompStruct({
  String? userContent,
  String? assistantContent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatCompStruct(
      userContent: userContent,
      assistantContent: assistantContent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatCompStruct? updateChatCompStruct(
  ChatCompStruct? chatComp, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatComp
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatCompStructData(
  Map<String, dynamic> firestoreData,
  ChatCompStruct? chatComp,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatComp == null) {
    return;
  }
  if (chatComp.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatComp.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatCompData = getChatCompFirestoreData(chatComp, forFieldValue);
  final nestedData = chatCompData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatComp.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatCompFirestoreData(
  ChatCompStruct? chatComp, [
  bool forFieldValue = false,
]) {
  if (chatComp == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatComp.toMap());

  // Add any Firestore field values
  chatComp.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatCompListFirestoreData(
  List<ChatCompStruct>? chatComps,
) =>
    chatComps?.map((e) => getChatCompFirestoreData(e, true)).toList() ?? [];
