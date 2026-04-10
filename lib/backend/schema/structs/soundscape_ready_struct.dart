// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SoundscapeReadyStruct extends FFFirebaseStruct {
  SoundscapeReadyStruct({
    String? audioUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _audioUrl = audioUrl,
        super(firestoreUtilData);

  // "audioUrl" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  set audioUrl(String? val) => _audioUrl = val;

  bool hasAudioUrl() => _audioUrl != null;

  static SoundscapeReadyStruct fromMap(Map<String, dynamic> data) =>
      SoundscapeReadyStruct(
        audioUrl: data['audioUrl'] as String?,
      );

  static SoundscapeReadyStruct? maybeFromMap(dynamic data) => data is Map
      ? SoundscapeReadyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'audioUrl': _audioUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'audioUrl': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static SoundscapeReadyStruct fromSerializableMap(Map<String, dynamic> data) =>
      SoundscapeReadyStruct(
        audioUrl: deserializeParam(
          data['audioUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SoundscapeReadyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SoundscapeReadyStruct && audioUrl == other.audioUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([audioUrl]);
}

SoundscapeReadyStruct createSoundscapeReadyStruct({
  String? audioUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SoundscapeReadyStruct(
      audioUrl: audioUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SoundscapeReadyStruct? updateSoundscapeReadyStruct(
  SoundscapeReadyStruct? soundscapeReady, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    soundscapeReady
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSoundscapeReadyStructData(
  Map<String, dynamic> firestoreData,
  SoundscapeReadyStruct? soundscapeReady,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (soundscapeReady == null) {
    return;
  }
  if (soundscapeReady.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && soundscapeReady.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final soundscapeReadyData =
      getSoundscapeReadyFirestoreData(soundscapeReady, forFieldValue);
  final nestedData =
      soundscapeReadyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = soundscapeReady.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSoundscapeReadyFirestoreData(
  SoundscapeReadyStruct? soundscapeReady, [
  bool forFieldValue = false,
]) {
  if (soundscapeReady == null) {
    return {};
  }
  final firestoreData = mapToFirestore(soundscapeReady.toMap());

  // Add any Firestore field values
  mapToFirestore(soundscapeReady.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSoundscapeReadyListFirestoreData(
  List<SoundscapeReadyStruct>? soundscapeReadys,
) =>
    soundscapeReadys
        ?.map((e) => getSoundscapeReadyFirestoreData(e, true))
        .toList() ??
    [];
