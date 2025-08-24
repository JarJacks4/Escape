// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AppContextStruct extends FFFirebaseStruct {
  AppContextStruct({
    String? contextRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contextRef = contextRef,
        super(firestoreUtilData);

  // "contextRef" field.
  String? _contextRef;
  String get contextRef => _contextRef ?? '';
  set contextRef(String? val) => _contextRef = val;

  bool hasContextRef() => _contextRef != null;

  static AppContextStruct fromMap(Map<String, dynamic> data) =>
      AppContextStruct(
        contextRef: data['contextRef'] as String?,
      );

  static AppContextStruct? maybeFromMap(dynamic data) => data is Map
      ? AppContextStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contextRef': _contextRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contextRef': serializeParam(
          _contextRef,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppContextStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppContextStruct(
        contextRef: deserializeParam(
          data['contextRef'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppContextStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppContextStruct && contextRef == other.contextRef;
  }

  @override
  int get hashCode => const ListEquality().hash([contextRef]);
}

AppContextStruct createAppContextStruct({
  String? contextRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppContextStruct(
      contextRef: contextRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppContextStruct? updateAppContextStruct(
  AppContextStruct? appContext, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appContext
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppContextStructData(
  Map<String, dynamic> firestoreData,
  AppContextStruct? appContext,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appContext == null) {
    return;
  }
  if (appContext.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appContext.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appContextData = getAppContextFirestoreData(appContext, forFieldValue);
  final nestedData = appContextData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appContext.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppContextFirestoreData(
  AppContextStruct? appContext, [
  bool forFieldValue = false,
]) {
  if (appContext == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appContext.toMap());

  // Add any Firestore field values
  appContext.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppContextListFirestoreData(
  List<AppContextStruct>? appContexts,
) =>
    appContexts?.map((e) => getAppContextFirestoreData(e, true)).toList() ?? [];
