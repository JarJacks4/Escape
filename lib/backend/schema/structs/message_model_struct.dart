// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageModelStruct extends FFFirebaseStruct {
  MessageModelStruct({
    String? role,
    String? content,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _role = role,
        _content = content,
        super(firestoreUtilData);

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  static MessageModelStruct fromMap(Map<String, dynamic> data) =>
      MessageModelStruct(
        role: data['role'] as String?,
        content: data['content'] as String?,
      );

  static MessageModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MessageModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'role': _role,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static MessageModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageModelStruct(
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MessageModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageModelStruct &&
        role == other.role &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([role, content]);
}

MessageModelStruct createMessageModelStruct({
  String? role,
  String? content,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageModelStruct(
      role: role,
      content: content,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageModelStruct? updateMessageModelStruct(
  MessageModelStruct? messageModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    messageModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageModelStructData(
  Map<String, dynamic> firestoreData,
  MessageModelStruct? messageModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (messageModel == null) {
    return;
  }
  if (messageModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && messageModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageModelData =
      getMessageModelFirestoreData(messageModel, forFieldValue);
  final nestedData =
      messageModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = messageModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageModelFirestoreData(
  MessageModelStruct? messageModel, [
  bool forFieldValue = false,
]) {
  if (messageModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(messageModel.toMap());

  // Add any Firestore field values
  messageModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageModelListFirestoreData(
  List<MessageModelStruct>? messageModels,
) =>
    messageModels?.map((e) => getMessageModelFirestoreData(e, true)).toList() ??
    [];
