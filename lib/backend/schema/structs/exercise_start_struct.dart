// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ExerciseStartStruct extends FFFirebaseStruct {
  ExerciseStartStruct({
    String? exerciseId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exerciseId = exerciseId,
        super(firestoreUtilData);

  // "exercise_id" field.
  String? _exerciseId;
  String get exerciseId => _exerciseId ?? '';
  set exerciseId(String? val) => _exerciseId = val;

  bool hasExerciseId() => _exerciseId != null;

  static ExerciseStartStruct fromMap(Map<String, dynamic> data) =>
      ExerciseStartStruct(
        exerciseId: data['exercise_id'] as String?,
      );

  static ExerciseStartStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseStartStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'exercise_id': _exerciseId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exercise_id': serializeParam(
          _exerciseId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExerciseStartStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExerciseStartStruct(
        exerciseId: deserializeParam(
          data['exercise_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExerciseStartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExerciseStartStruct && exerciseId == other.exerciseId;
  }

  @override
  int get hashCode => const ListEquality().hash([exerciseId]);
}

ExerciseStartStruct createExerciseStartStruct({
  String? exerciseId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExerciseStartStruct(
      exerciseId: exerciseId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExerciseStartStruct? updateExerciseStartStruct(
  ExerciseStartStruct? exerciseStart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    exerciseStart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExerciseStartStructData(
  Map<String, dynamic> firestoreData,
  ExerciseStartStruct? exerciseStart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (exerciseStart == null) {
    return;
  }
  if (exerciseStart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && exerciseStart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final exerciseStartData =
      getExerciseStartFirestoreData(exerciseStart, forFieldValue);
  final nestedData =
      exerciseStartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = exerciseStart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExerciseStartFirestoreData(
  ExerciseStartStruct? exerciseStart, [
  bool forFieldValue = false,
]) {
  if (exerciseStart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(exerciseStart.toMap());

  // Add any Firestore field values
  mapToFirestore(exerciseStart.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExerciseStartListFirestoreData(
  List<ExerciseStartStruct>? exerciseStarts,
) =>
    exerciseStarts
        ?.map((e) => getExerciseStartFirestoreData(e, true))
        .toList() ??
    [];
