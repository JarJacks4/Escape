// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageStruct extends FFFirebaseStruct {
  MessageStruct({
    String? id,
    String? text,
    DateTime? timestamp,
    MessageStatus? status,
    UserStruct? sender,
    List<AttachmentStruct>? attachment,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _text = text,
        _timestamp = timestamp,
        _status = status,
        _sender = sender,
        _attachment = attachment,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "status" field.
  MessageStatus? _status;
  MessageStatus? get status => _status;
  set status(MessageStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "sender" field.
  UserStruct? _sender;
  UserStruct get sender => _sender ?? UserStruct();
  set sender(UserStruct? val) => _sender = val;

  void updateSender(Function(UserStruct) updateFn) {
    updateFn(_sender ??= UserStruct());
  }

  bool hasSender() => _sender != null;

  // "attachment" field.
  List<AttachmentStruct>? _attachment;
  List<AttachmentStruct> get attachment => _attachment ?? const [];
  set attachment(List<AttachmentStruct>? val) => _attachment = val;

  void updateAttachment(Function(List<AttachmentStruct>) updateFn) {
    updateFn(_attachment ??= []);
  }

  bool hasAttachment() => _attachment != null;

  static MessageStruct fromMap(Map<String, dynamic> data) => MessageStruct(
        id: data['id'] as String?,
        text: data['text'] as String?,
        timestamp: data['timestamp'] as DateTime?,
        status: data['status'] is MessageStatus
            ? data['status']
            : deserializeEnum<MessageStatus>(data['status']),
        sender: data['sender'] is UserStruct
            ? data['sender']
            : UserStruct.maybeFromMap(data['sender']),
        attachment: getStructList(
          data['attachment'],
          AttachmentStruct.fromMap,
        ),
      );

  static MessageStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'text': _text,
        'timestamp': _timestamp,
        'status': _status?.serialize(),
        'sender': _sender?.toMap(),
        'attachment': _attachment?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'sender': serializeParam(
          _sender,
          ParamType.DataStruct,
        ),
        'attachment': serializeParam(
          _attachment,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam<MessageStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        sender: deserializeStructParam(
          data['sender'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        attachment: deserializeStructParam<AttachmentStruct>(
          data['attachment'],
          ParamType.DataStruct,
          true,
          structBuilder: AttachmentStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MessageStruct &&
        id == other.id &&
        text == other.text &&
        timestamp == other.timestamp &&
        status == other.status &&
        sender == other.sender &&
        listEquality.equals(attachment, other.attachment);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, text, timestamp, status, sender, attachment]);
}

MessageStruct createMessageStruct({
  String? id,
  String? text,
  DateTime? timestamp,
  MessageStatus? status,
  UserStruct? sender,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageStruct(
      id: id,
      text: text,
      timestamp: timestamp,
      status: status,
      sender: sender ?? (clearUnsetFields ? UserStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageStruct? updateMessageStruct(
  MessageStruct? message, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    message
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageStructData(
  Map<String, dynamic> firestoreData,
  MessageStruct? message,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (message == null) {
    return;
  }
  if (message.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && message.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageData = getMessageFirestoreData(message, forFieldValue);
  final nestedData = messageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = message.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageFirestoreData(
  MessageStruct? message, [
  bool forFieldValue = false,
]) {
  if (message == null) {
    return {};
  }
  final firestoreData = mapToFirestore(message.toMap());

  // Handle nested data for "sender" field.
  addUserStructData(
    firestoreData,
    message.hasSender() ? message.sender : null,
    'sender',
    forFieldValue,
  );

  // Add any Firestore field values
  message.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageListFirestoreData(
  List<MessageStruct>? messages,
) =>
    messages?.map((e) => getMessageFirestoreData(e, true)).toList() ?? [];
