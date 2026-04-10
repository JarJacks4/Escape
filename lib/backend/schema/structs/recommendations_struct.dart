// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RecommendationsStruct extends FFFirebaseStruct {
  RecommendationsStruct({
    String? exerciseId,
    String? modality,
    String? title,
    String? description,
    String? reason,
    String? difficulty,
    int? durationMinutes,
    String? rlMeta,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exerciseId = exerciseId,
        _modality = modality,
        _title = title,
        _description = description,
        _reason = reason,
        _difficulty = difficulty,
        _durationMinutes = durationMinutes,
        _rlMeta = rlMeta,
        super(firestoreUtilData);

  // "exercise_id" field.
  String? _exerciseId;
  String get exerciseId => _exerciseId ?? '';
  set exerciseId(String? val) => _exerciseId = val;

  bool hasExerciseId() => _exerciseId != null;

  // "modality" field.
  String? _modality;
  String get modality => _modality ?? '';
  set modality(String? val) => _modality = val;

  bool hasModality() => _modality != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  set reason(String? val) => _reason = val;

  bool hasReason() => _reason != null;

  // "difficulty" field.
  String? _difficulty;
  String get difficulty => _difficulty ?? '';
  set difficulty(String? val) => _difficulty = val;

  bool hasDifficulty() => _difficulty != null;

  // "duration_minutes" field.
  int? _durationMinutes;
  int get durationMinutes => _durationMinutes ?? 0;
  set durationMinutes(int? val) => _durationMinutes = val;

  void incrementDurationMinutes(int amount) =>
      durationMinutes = durationMinutes + amount;

  bool hasDurationMinutes() => _durationMinutes != null;

  // "rl_meta" field.
  String? _rlMeta;
  String get rlMeta => _rlMeta ?? '';
  set rlMeta(String? val) => _rlMeta = val;

  bool hasRlMeta() => _rlMeta != null;

  static RecommendationsStruct fromMap(Map<String, dynamic> data) =>
      RecommendationsStruct(
        exerciseId: data['exercise_id'] as String?,
        modality: data['modality'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        reason: data['reason'] as String?,
        difficulty: data['difficulty'] as String?,
        durationMinutes: castToType<int>(data['duration_minutes']),
        rlMeta: data['rl_meta'] as String?,
      );

  static RecommendationsStruct? maybeFromMap(dynamic data) => data is Map
      ? RecommendationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'exercise_id': _exerciseId,
        'modality': _modality,
        'title': _title,
        'description': _description,
        'reason': _reason,
        'difficulty': _difficulty,
        'duration_minutes': _durationMinutes,
        'rl_meta': _rlMeta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exercise_id': serializeParam(
          _exerciseId,
          ParamType.String,
        ),
        'modality': serializeParam(
          _modality,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'reason': serializeParam(
          _reason,
          ParamType.String,
        ),
        'difficulty': serializeParam(
          _difficulty,
          ParamType.String,
        ),
        'duration_minutes': serializeParam(
          _durationMinutes,
          ParamType.int,
        ),
        'rl_meta': serializeParam(
          _rlMeta,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecommendationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecommendationsStruct(
        exerciseId: deserializeParam(
          data['exercise_id'],
          ParamType.String,
          false,
        ),
        modality: deserializeParam(
          data['modality'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        reason: deserializeParam(
          data['reason'],
          ParamType.String,
          false,
        ),
        difficulty: deserializeParam(
          data['difficulty'],
          ParamType.String,
          false,
        ),
        durationMinutes: deserializeParam(
          data['duration_minutes'],
          ParamType.int,
          false,
        ),
        rlMeta: deserializeParam(
          data['rl_meta'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecommendationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecommendationsStruct &&
        exerciseId == other.exerciseId &&
        modality == other.modality &&
        title == other.title &&
        description == other.description &&
        reason == other.reason &&
        difficulty == other.difficulty &&
        durationMinutes == other.durationMinutes &&
        rlMeta == other.rlMeta;
  }

  @override
  int get hashCode => const ListEquality().hash([
        exerciseId,
        modality,
        title,
        description,
        reason,
        difficulty,
        durationMinutes,
        rlMeta
      ]);
}

RecommendationsStruct createRecommendationsStruct({
  String? exerciseId,
  String? modality,
  String? title,
  String? description,
  String? reason,
  String? difficulty,
  int? durationMinutes,
  String? rlMeta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecommendationsStruct(
      exerciseId: exerciseId,
      modality: modality,
      title: title,
      description: description,
      reason: reason,
      difficulty: difficulty,
      durationMinutes: durationMinutes,
      rlMeta: rlMeta,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecommendationsStruct? updateRecommendationsStruct(
  RecommendationsStruct? recommendations, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recommendations
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecommendationsStructData(
  Map<String, dynamic> firestoreData,
  RecommendationsStruct? recommendations,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recommendations == null) {
    return;
  }
  if (recommendations.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recommendations.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recommendationsData =
      getRecommendationsFirestoreData(recommendations, forFieldValue);
  final nestedData =
      recommendationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recommendations.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecommendationsFirestoreData(
  RecommendationsStruct? recommendations, [
  bool forFieldValue = false,
]) {
  if (recommendations == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recommendations.toMap());

  // Add any Firestore field values
  mapToFirestore(recommendations.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecommendationsListFirestoreData(
  List<RecommendationsStruct>? recommendationss,
) =>
    recommendationss
        ?.map((e) => getRecommendationsFirestoreData(e, true))
        .toList() ??
    [];
