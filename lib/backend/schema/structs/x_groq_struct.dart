// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class XGroqStruct extends FFFirebaseStruct {
  XGroqStruct({
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static XGroqStruct fromMap(Map<String, dynamic> data) => XGroqStruct(
        id: data['id'] as String?,
      );

  static XGroqStruct? maybeFromMap(dynamic data) =>
      data is Map ? XGroqStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static XGroqStruct fromSerializableMap(Map<String, dynamic> data) =>
      XGroqStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'XGroqStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is XGroqStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

XGroqStruct createXGroqStruct({
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    XGroqStruct(
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

XGroqStruct? updateXGroqStruct(
  XGroqStruct? xGroq, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    xGroq
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addXGroqStructData(
  Map<String, dynamic> firestoreData,
  XGroqStruct? xGroq,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (xGroq == null) {
    return;
  }
  if (xGroq.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && xGroq.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final xGroqData = getXGroqFirestoreData(xGroq, forFieldValue);
  final nestedData = xGroqData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = xGroq.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getXGroqFirestoreData(
  XGroqStruct? xGroq, [
  bool forFieldValue = false,
]) {
  if (xGroq == null) {
    return {};
  }
  final firestoreData = mapToFirestore(xGroq.toMap());

  // Add any Firestore field values
  xGroq.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getXGroqListFirestoreData(
  List<XGroqStruct>? xGroqs,
) =>
    xGroqs?.map((e) => getXGroqFirestoreData(e, true)).toList() ?? [];
