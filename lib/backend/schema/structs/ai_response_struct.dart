// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AiResponseStruct extends FFFirebaseStruct {
  AiResponseStruct({
    String? message,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _type = type,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static AiResponseStruct fromMap(Map<String, dynamic> data) =>
      AiResponseStruct(
        message: data['message'] as String?,
        type: data['type'] as String?,
      );

  static AiResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? AiResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static AiResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      AiResponseStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AiResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AiResponseStruct &&
        message == other.message &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([message, type]);
}

AiResponseStruct createAiResponseStruct({
  String? message,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AiResponseStruct(
      message: message,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AiResponseStruct? updateAiResponseStruct(
  AiResponseStruct? aiResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aiResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAiResponseStructData(
  Map<String, dynamic> firestoreData,
  AiResponseStruct? aiResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aiResponse == null) {
    return;
  }
  if (aiResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aiResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aiResponseData = getAiResponseFirestoreData(aiResponse, forFieldValue);
  final nestedData = aiResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aiResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAiResponseFirestoreData(
  AiResponseStruct? aiResponse, [
  bool forFieldValue = false,
]) {
  if (aiResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aiResponse.toMap());

  // Add any Firestore field values
  mapToFirestore(aiResponse.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAiResponseListFirestoreData(
  List<AiResponseStruct>? aiResponses,
) =>
    aiResponses?.map((e) => getAiResponseFirestoreData(e, true)).toList() ?? [];
