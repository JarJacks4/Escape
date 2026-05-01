// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MoodScannedStruct extends FFFirebaseStruct {
  MoodScannedStruct({
    String? mood,
    int? intensity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mood = mood,
        _intensity = intensity,
        super(firestoreUtilData);

  // "mood" field.
  String? _mood;
  String get mood => _mood ?? '';
  set mood(String? val) => _mood = val;

  bool hasMood() => _mood != null;

  // "intensity" field.
  int? _intensity;
  int get intensity => _intensity ?? 0;
  set intensity(int? val) => _intensity = val;

  void incrementIntensity(int amount) => intensity = intensity + amount;

  bool hasIntensity() => _intensity != null;

  static MoodScannedStruct fromMap(Map<String, dynamic> data) =>
      MoodScannedStruct(
        mood: data['mood'] as String?,
        intensity: castToType<int>(data['intensity']),
      );

  static MoodScannedStruct? maybeFromMap(dynamic data) => data is Map
      ? MoodScannedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mood': _mood,
        'intensity': _intensity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mood': serializeParam(
          _mood,
          ParamType.String,
        ),
        'intensity': serializeParam(
          _intensity,
          ParamType.int,
        ),
      }.withoutNulls;

  static MoodScannedStruct fromSerializableMap(Map<String, dynamic> data) =>
      MoodScannedStruct(
        mood: deserializeParam(
          data['mood'],
          ParamType.String,
          false,
        ),
        intensity: deserializeParam(
          data['intensity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MoodScannedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MoodScannedStruct &&
        mood == other.mood &&
        intensity == other.intensity;
  }

  @override
  int get hashCode => const ListEquality().hash([mood, intensity]);
}

MoodScannedStruct createMoodScannedStruct({
  String? mood,
  int? intensity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MoodScannedStruct(
      mood: mood,
      intensity: intensity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MoodScannedStruct? updateMoodScannedStruct(
  MoodScannedStruct? moodScanned, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    moodScanned
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMoodScannedStructData(
  Map<String, dynamic> firestoreData,
  MoodScannedStruct? moodScanned,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (moodScanned == null) {
    return;
  }
  if (moodScanned.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && moodScanned.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final moodScannedData =
      getMoodScannedFirestoreData(moodScanned, forFieldValue);
  final nestedData =
      moodScannedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = moodScanned.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMoodScannedFirestoreData(
  MoodScannedStruct? moodScanned, [
  bool forFieldValue = false,
]) {
  if (moodScanned == null) {
    return {};
  }
  final firestoreData = mapToFirestore(moodScanned.toMap());

  // Add any Firestore field values
  mapToFirestore(moodScanned.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMoodScannedListFirestoreData(
  List<MoodScannedStruct>? moodScanneds,
) =>
    moodScanneds?.map((e) => getMoodScannedFirestoreData(e, true)).toList() ??
    [];
