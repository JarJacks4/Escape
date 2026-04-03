// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LucilleMessageStruct extends FFFirebaseStruct {
  LucilleMessageStruct({
    List<String>? messages,
    DateTime? createdAt,
    String? message,
    String? sender,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _messages = messages,
        _createdAt = createdAt,
        _message = message,
        _sender = sender,
        super(firestoreUtilData);

  // "messages" field.
  List<String>? _messages;
  List<String> get messages => _messages ?? const [];
  set messages(List<String>? val) => _messages = val;

  void updateMessages(Function(List<String>) updateFn) {
    updateFn(_messages ??= []);
  }

  bool hasMessages() => _messages != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  set sender(String? val) => _sender = val;

  bool hasSender() => _sender != null;

  static LucilleMessageStruct fromMap(Map<String, dynamic> data) =>
      LucilleMessageStruct(
        messages: getDataList(data['messages']),
        createdAt: data['created_at'] as DateTime?,
        message: data['message'] as String?,
        sender: data['sender'] as String?,
      );

  static LucilleMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? LucilleMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'messages': _messages,
        'created_at': _createdAt,
        'message': _message,
        'sender': _sender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'messages': serializeParam(
          _messages,
          ParamType.String,
          isList: true,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'sender': serializeParam(
          _sender,
          ParamType.String,
        ),
      }.withoutNulls;

  static LucilleMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      LucilleMessageStruct(
        messages: deserializeParam<String>(
          data['messages'],
          ParamType.String,
          true,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        sender: deserializeParam(
          data['sender'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LucilleMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LucilleMessageStruct &&
        listEquality.equals(messages, other.messages) &&
        createdAt == other.createdAt &&
        message == other.message &&
        sender == other.sender;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([messages, createdAt, message, sender]);
}

LucilleMessageStruct createLucilleMessageStruct({
  DateTime? createdAt,
  String? message,
  String? sender,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LucilleMessageStruct(
      createdAt: createdAt,
      message: message,
      sender: sender,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LucilleMessageStruct? updateLucilleMessageStruct(
  LucilleMessageStruct? lucilleMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lucilleMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLucilleMessageStructData(
  Map<String, dynamic> firestoreData,
  LucilleMessageStruct? lucilleMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lucilleMessage == null) {
    return;
  }
  if (lucilleMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lucilleMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lucilleMessageData =
      getLucilleMessageFirestoreData(lucilleMessage, forFieldValue);
  final nestedData =
      lucilleMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lucilleMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLucilleMessageFirestoreData(
  LucilleMessageStruct? lucilleMessage, [
  bool forFieldValue = false,
]) {
  if (lucilleMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lucilleMessage.toMap());

  // Add any Firestore field values
  mapToFirestore(lucilleMessage.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLucilleMessageListFirestoreData(
  List<LucilleMessageStruct>? lucilleMessages,
) =>
    lucilleMessages
        ?.map((e) => getLucilleMessageFirestoreData(e, true))
        .toList() ??
    [];
