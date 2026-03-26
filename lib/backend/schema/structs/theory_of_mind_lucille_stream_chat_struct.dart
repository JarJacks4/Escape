// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TheoryOfMindLucilleStreamChatStruct extends FFFirebaseStruct {
  TheoryOfMindLucilleStreamChatStruct({
    String? content,
    bool? done,
    String? sessionId,
    String? response,
    int? messageCount,
    String? detectedEmotion,
    String? detectedIntent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _content = content,
        _done = done,
        _sessionId = sessionId,
        _response = response,
        _messageCount = messageCount,
        _detectedEmotion = detectedEmotion,
        _detectedIntent = detectedIntent,
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

  // "detected_emotion" field.
  String? _detectedEmotion;
  String get detectedEmotion => _detectedEmotion ?? '';
  set detectedEmotion(String? val) => _detectedEmotion = val;

  bool hasDetectedEmotion() => _detectedEmotion != null;

  // "detected_intent" field.
  String? _detectedIntent;
  String get detectedIntent => _detectedIntent ?? '';
  set detectedIntent(String? val) => _detectedIntent = val;

  bool hasDetectedIntent() => _detectedIntent != null;

  static TheoryOfMindLucilleStreamChatStruct fromMap(
          Map<String, dynamic> data) =>
      TheoryOfMindLucilleStreamChatStruct(
        content: data['content'] as String?,
        done: data['done'] as bool?,
        sessionId: data['session_id'] as String?,
        response: data['response'] as String?,
        messageCount: castToType<int>(data['message_count']),
        detectedEmotion: data['detected_emotion'] as String?,
        detectedIntent: data['detected_intent'] as String?,
      );

  static TheoryOfMindLucilleStreamChatStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? TheoryOfMindLucilleStreamChatStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'done': _done,
        'session_id': _sessionId,
        'response': _response,
        'message_count': _messageCount,
        'detected_emotion': _detectedEmotion,
        'detected_intent': _detectedIntent,
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
        'detected_emotion': serializeParam(
          _detectedEmotion,
          ParamType.String,
        ),
        'detected_intent': serializeParam(
          _detectedIntent,
          ParamType.String,
        ),
      }.withoutNulls;

  static TheoryOfMindLucilleStreamChatStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TheoryOfMindLucilleStreamChatStruct(
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
        detectedEmotion: deserializeParam(
          data['detected_emotion'],
          ParamType.String,
          false,
        ),
        detectedIntent: deserializeParam(
          data['detected_intent'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TheoryOfMindLucilleStreamChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TheoryOfMindLucilleStreamChatStruct &&
        content == other.content &&
        done == other.done &&
        sessionId == other.sessionId &&
        response == other.response &&
        messageCount == other.messageCount &&
        detectedEmotion == other.detectedEmotion &&
        detectedIntent == other.detectedIntent;
  }

  @override
  int get hashCode => const ListEquality().hash([
        content,
        done,
        sessionId,
        response,
        messageCount,
        detectedEmotion,
        detectedIntent
      ]);
}

TheoryOfMindLucilleStreamChatStruct createTheoryOfMindLucilleStreamChatStruct({
  String? content,
  bool? done,
  String? sessionId,
  String? response,
  int? messageCount,
  String? detectedEmotion,
  String? detectedIntent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TheoryOfMindLucilleStreamChatStruct(
      content: content,
      done: done,
      sessionId: sessionId,
      response: response,
      messageCount: messageCount,
      detectedEmotion: detectedEmotion,
      detectedIntent: detectedIntent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TheoryOfMindLucilleStreamChatStruct? updateTheoryOfMindLucilleStreamChatStruct(
  TheoryOfMindLucilleStreamChatStruct? theoryOfMindLucilleStreamChat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    theoryOfMindLucilleStreamChat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTheoryOfMindLucilleStreamChatStructData(
  Map<String, dynamic> firestoreData,
  TheoryOfMindLucilleStreamChatStruct? theoryOfMindLucilleStreamChat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (theoryOfMindLucilleStreamChat == null) {
    return;
  }
  if (theoryOfMindLucilleStreamChat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      theoryOfMindLucilleStreamChat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final theoryOfMindLucilleStreamChatData =
      getTheoryOfMindLucilleStreamChatFirestoreData(
          theoryOfMindLucilleStreamChat, forFieldValue);
  final nestedData = theoryOfMindLucilleStreamChatData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      theoryOfMindLucilleStreamChat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTheoryOfMindLucilleStreamChatFirestoreData(
  TheoryOfMindLucilleStreamChatStruct? theoryOfMindLucilleStreamChat, [
  bool forFieldValue = false,
]) {
  if (theoryOfMindLucilleStreamChat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(theoryOfMindLucilleStreamChat.toMap());

  // Add any Firestore field values
  theoryOfMindLucilleStreamChat.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTheoryOfMindLucilleStreamChatListFirestoreData(
  List<TheoryOfMindLucilleStreamChatStruct>? theoryOfMindLucilleStreamChats,
) =>
    theoryOfMindLucilleStreamChats
        ?.map((e) => getTheoryOfMindLucilleStreamChatFirestoreData(e, true))
        .toList() ??
    [];
