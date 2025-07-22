// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatSessionStruct extends FFFirebaseStruct {
  ChatSessionStruct({
    String? id,
    List<UserStruct>? participants,
    MessageStruct? lastMessage,
    DateTime? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _participants = participants,
        _lastMessage = lastMessage,
        _timestamp = timestamp,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "participants" field.
  List<UserStruct>? _participants;
  List<UserStruct> get participants => _participants ?? const [];
  set participants(List<UserStruct>? val) => _participants = val;

  void updateParticipants(Function(List<UserStruct>) updateFn) {
    updateFn(_participants ??= []);
  }

  bool hasParticipants() => _participants != null;

  // "lastMessage" field.
  MessageStruct? _lastMessage;
  MessageStruct get lastMessage => _lastMessage ?? MessageStruct();
  set lastMessage(MessageStruct? val) => _lastMessage = val;

  void updateLastMessage(Function(MessageStruct) updateFn) {
    updateFn(_lastMessage ??= MessageStruct());
  }

  bool hasLastMessage() => _lastMessage != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static ChatSessionStruct fromMap(Map<String, dynamic> data) =>
      ChatSessionStruct(
        id: data['id'] as String?,
        participants: getStructList(
          data['participants'],
          UserStruct.fromMap,
        ),
        lastMessage: data['lastMessage'] is MessageStruct
            ? data['lastMessage']
            : MessageStruct.maybeFromMap(data['lastMessage']),
        timestamp: data['timestamp'] as DateTime?,
      );

  static ChatSessionStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatSessionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'participants': _participants?.map((e) => e.toMap()).toList(),
        'lastMessage': _lastMessage?.toMap(),
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'participants': serializeParam(
          _participants,
          ParamType.DataStruct,
          isList: true,
        ),
        'lastMessage': serializeParam(
          _lastMessage,
          ParamType.DataStruct,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChatSessionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatSessionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        participants: deserializeStructParam<UserStruct>(
          data['participants'],
          ParamType.DataStruct,
          true,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        lastMessage: deserializeStructParam(
          data['lastMessage'],
          ParamType.DataStruct,
          false,
          structBuilder: MessageStruct.fromSerializableMap,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ChatSessionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatSessionStruct &&
        id == other.id &&
        listEquality.equals(participants, other.participants) &&
        lastMessage == other.lastMessage &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, participants, lastMessage, timestamp]);
}

ChatSessionStruct createChatSessionStruct({
  String? id,
  MessageStruct? lastMessage,
  DateTime? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatSessionStruct(
      id: id,
      lastMessage: lastMessage ?? (clearUnsetFields ? MessageStruct() : null),
      timestamp: timestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatSessionStruct? updateChatSessionStruct(
  ChatSessionStruct? chatSession, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatSession
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatSessionStructData(
  Map<String, dynamic> firestoreData,
  ChatSessionStruct? chatSession,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatSession == null) {
    return;
  }
  if (chatSession.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatSession.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatSessionData =
      getChatSessionFirestoreData(chatSession, forFieldValue);
  final nestedData =
      chatSessionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatSession.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatSessionFirestoreData(
  ChatSessionStruct? chatSession, [
  bool forFieldValue = false,
]) {
  if (chatSession == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatSession.toMap());

  // Handle nested data for "lastMessage" field.
  addMessageStructData(
    firestoreData,
    chatSession.hasLastMessage() ? chatSession.lastMessage : null,
    'lastMessage',
    forFieldValue,
  );

  // Add any Firestore field values
  chatSession.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatSessionListFirestoreData(
  List<ChatSessionStruct>? chatSessions,
) =>
    chatSessions?.map((e) => getChatSessionFirestoreData(e, true)).toList() ??
    [];
