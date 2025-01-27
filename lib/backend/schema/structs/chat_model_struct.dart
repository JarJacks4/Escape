// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatModelStruct extends FFFirebaseStruct {
  ChatModelStruct({
    String? id,
    int? created,
    String? question,
    String? answer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _created = created,
        _question = question,
        _answer = answer,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  static ChatModelStruct fromMap(Map<String, dynamic> data) => ChatModelStruct(
        id: data['id'] as String?,
        created: castToType<int>(data['created']),
        question: data['question'] as String?,
        answer: data['answer'] as String?,
      );

  static ChatModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created': _created,
        'question': _question,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatModelStruct &&
        id == other.id &&
        created == other.created &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, created, question, answer]);
}

ChatModelStruct createChatModelStruct({
  String? id,
  int? created,
  String? question,
  String? answer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatModelStruct(
      id: id,
      created: created,
      question: question,
      answer: answer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatModelStruct? updateChatModelStruct(
  ChatModelStruct? chatModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatModelStructData(
  Map<String, dynamic> firestoreData,
  ChatModelStruct? chatModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatModel == null) {
    return;
  }
  if (chatModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatModelData = getChatModelFirestoreData(chatModel, forFieldValue);
  final nestedData = chatModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatModelFirestoreData(
  ChatModelStruct? chatModel, [
  bool forFieldValue = false,
]) {
  if (chatModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatModel.toMap());

  // Add any Firestore field values
  chatModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatModelListFirestoreData(
  List<ChatModelStruct>? chatModels,
) =>
    chatModels?.map((e) => getChatModelFirestoreData(e, true)).toList() ?? [];
