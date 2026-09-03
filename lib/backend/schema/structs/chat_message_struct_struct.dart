// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStructStruct extends FFFirebaseStruct {
  ChatMessageStructStruct({
    String? text,
    bool? isFromUser,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _isFromUser = isFromUser,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "isFromUser" field.
  bool? _isFromUser;
  bool get isFromUser => _isFromUser ?? false;
  set isFromUser(bool? val) => _isFromUser = val;

  bool hasIsFromUser() => _isFromUser != null;

  static ChatMessageStructStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStructStruct(
        text: data['text'] as String?,
        isFromUser: data['isFromUser'] as bool?,
      );

  static ChatMessageStructStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessageStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'isFromUser': _isFromUser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'isFromUser': serializeParam(
          _isFromUser,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChatMessageStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChatMessageStructStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        isFromUser: deserializeParam(
          data['isFromUser'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageStructStruct &&
        text == other.text &&
        isFromUser == other.isFromUser;
  }

  @override
  int get hashCode => const ListEquality().hash([text, isFromUser]);
}

ChatMessageStructStruct createChatMessageStructStruct({
  String? text,
  bool? isFromUser,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMessageStructStruct(
      text: text,
      isFromUser: isFromUser,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMessageStructStruct? updateChatMessageStructStruct(
  ChatMessageStructStruct? chatMessageStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMessageStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMessageStructStructData(
  Map<String, dynamic> firestoreData,
  ChatMessageStructStruct? chatMessageStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMessageStruct == null) {
    return;
  }
  if (chatMessageStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMessageStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMessageStructData =
      getChatMessageStructFirestoreData(chatMessageStruct, forFieldValue);
  final nestedData =
      chatMessageStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatMessageStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMessageStructFirestoreData(
  ChatMessageStructStruct? chatMessageStruct, [
  bool forFieldValue = false,
]) {
  if (chatMessageStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMessageStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(chatMessageStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMessageStructListFirestoreData(
  List<ChatMessageStructStruct>? chatMessageStructs,
) =>
    chatMessageStructs
        ?.map((e) => getChatMessageStructFirestoreData(e, true))
        .toList() ??
    [];
