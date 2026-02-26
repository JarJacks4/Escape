// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LucilleStreamFINALStruct extends FFFirebaseStruct {
  LucilleStreamFINALStruct({
    String? content,
    bool? done,
    String? sessionId,
    String? response,
    int? messageCount,
    Role? role,
    String? userMessage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _content = content,
        _done = done,
        _sessionId = sessionId,
        _response = response,
        _messageCount = messageCount,
        _role = role,
        _userMessage = userMessage,
        super(firestoreUtilData);

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  set done(bool? val) => _done = val;

  bool hasDone() => _done != null;

  // "session_id" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;

  bool hasSessionId() => _sessionId != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  set response(String? val) => _response = val;

  bool hasResponse() => _response != null;

  // "message_count" field.
  int? _messageCount;
  int get messageCount => _messageCount ?? 0;
  set messageCount(int? val) => _messageCount = val;

  void incrementMessageCount(int amount) =>
      messageCount = messageCount + amount;

  bool hasMessageCount() => _messageCount != null;

  // "Role" field.
  Role? _role;
  Role? get role => _role;
  set role(Role? val) => _role = val;

  bool hasRole() => _role != null;

  // "UserMessage" field.
  String? _userMessage;
  String get userMessage => _userMessage ?? '';
  set userMessage(String? val) => _userMessage = val;

  bool hasUserMessage() => _userMessage != null;

  static LucilleStreamFINALStruct fromMap(Map<String, dynamic> data) =>
      LucilleStreamFINALStruct(
        content: data['content'] as String?,
        done: data['done'] as bool?,
        sessionId: data['session_id'] as String?,
        response: data['response'] as String?,
        messageCount: castToType<int>(data['message_count']),
        role: data['Role'] is Role
            ? data['Role']
            : deserializeEnum<Role>(data['Role']),
        userMessage: data['UserMessage'] as String?,
      );

  static LucilleStreamFINALStruct? maybeFromMap(dynamic data) => data is Map
      ? LucilleStreamFINALStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'done': _done,
        'session_id': _sessionId,
        'response': _response,
        'message_count': _messageCount,
        'Role': _role?.serialize(),
        'UserMessage': _userMessage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'done': serializeParam(
          _done,
          ParamType.bool,
        ),
        'session_id': serializeParam(
          _sessionId,
          ParamType.String,
        ),
        'response': serializeParam(
          _response,
          ParamType.String,
        ),
        'message_count': serializeParam(
          _messageCount,
          ParamType.int,
        ),
        'Role': serializeParam(
          _role,
          ParamType.Enum,
        ),
        'UserMessage': serializeParam(
          _userMessage,
          ParamType.String,
        ),
      }.withoutNulls;

  static LucilleStreamFINALStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LucilleStreamFINALStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        done: deserializeParam(
          data['done'],
          ParamType.bool,
          false,
        ),
        sessionId: deserializeParam(
          data['session_id'],
          ParamType.String,
          false,
        ),
        response: deserializeParam(
          data['response'],
          ParamType.String,
          false,
        ),
        messageCount: deserializeParam(
          data['message_count'],
          ParamType.int,
          false,
        ),
        role: deserializeParam<Role>(
          data['Role'],
          ParamType.Enum,
          false,
        ),
        userMessage: deserializeParam(
          data['UserMessage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LucilleStreamFINALStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LucilleStreamFINALStruct &&
        content == other.content &&
        done == other.done &&
        sessionId == other.sessionId &&
        response == other.response &&
        messageCount == other.messageCount &&
        role == other.role &&
        userMessage == other.userMessage;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [content, done, sessionId, response, messageCount, role, userMessage]);
}

LucilleStreamFINALStruct createLucilleStreamFINALStruct({
  String? content,
  bool? done,
  String? sessionId,
  String? response,
  int? messageCount,
  Role? role,
  String? userMessage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LucilleStreamFINALStruct(
      content: content,
      done: done,
      sessionId: sessionId,
      response: response,
      messageCount: messageCount,
      role: role,
      userMessage: userMessage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LucilleStreamFINALStruct? updateLucilleStreamFINALStruct(
  LucilleStreamFINALStruct? lucilleStreamFINAL, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lucilleStreamFINAL
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLucilleStreamFINALStructData(
  Map<String, dynamic> firestoreData,
  LucilleStreamFINALStruct? lucilleStreamFINAL,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lucilleStreamFINAL == null) {
    return;
  }
  if (lucilleStreamFINAL.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lucilleStreamFINAL.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lucilleStreamFINALData =
      getLucilleStreamFINALFirestoreData(lucilleStreamFINAL, forFieldValue);
  final nestedData =
      lucilleStreamFINALData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      lucilleStreamFINAL.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLucilleStreamFINALFirestoreData(
  LucilleStreamFINALStruct? lucilleStreamFINAL, [
  bool forFieldValue = false,
]) {
  if (lucilleStreamFINAL == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lucilleStreamFINAL.toMap());

  // Add any Firestore field values
  lucilleStreamFINAL.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLucilleStreamFINALListFirestoreData(
  List<LucilleStreamFINALStruct>? lucilleStreamFINALs,
) =>
    lucilleStreamFINALs
        ?.map((e) => getLucilleStreamFINALFirestoreData(e, true))
        .toList() ??
    [];
