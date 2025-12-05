// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EpidemicSoundStruct extends FFFirebaseStruct {
  EpidemicSoundStruct({
    List<String>? tracks,
    List<String>? albums,
    String? epidemicSoundToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tracks = tracks,
        _albums = albums,
        _epidemicSoundToken = epidemicSoundToken,
        super(firestoreUtilData);

  // "Tracks" field.
  List<String>? _tracks;
  List<String> get tracks => _tracks ?? const [];
  set tracks(List<String>? val) => _tracks = val;

  void updateTracks(Function(List<String>) updateFn) {
    updateFn(_tracks ??= []);
  }

  bool hasTracks() => _tracks != null;

  // "Albums" field.
  List<String>? _albums;
  List<String> get albums => _albums ?? const [];
  set albums(List<String>? val) => _albums = val;

  void updateAlbums(Function(List<String>) updateFn) {
    updateFn(_albums ??= []);
  }

  bool hasAlbums() => _albums != null;

  // "EpidemicSoundToken" field.
  String? _epidemicSoundToken;
  String get epidemicSoundToken => _epidemicSoundToken ?? '';
  set epidemicSoundToken(String? val) => _epidemicSoundToken = val;

  bool hasEpidemicSoundToken() => _epidemicSoundToken != null;

  static EpidemicSoundStruct fromMap(Map<String, dynamic> data) =>
      EpidemicSoundStruct(
        tracks: getDataList(data['Tracks']),
        albums: getDataList(data['Albums']),
        epidemicSoundToken: data['EpidemicSoundToken'] as String?,
      );

  static EpidemicSoundStruct? maybeFromMap(dynamic data) => data is Map
      ? EpidemicSoundStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Tracks': _tracks,
        'Albums': _albums,
        'EpidemicSoundToken': _epidemicSoundToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Tracks': serializeParam(
          _tracks,
          ParamType.String,
          isList: true,
        ),
        'Albums': serializeParam(
          _albums,
          ParamType.String,
          isList: true,
        ),
        'EpidemicSoundToken': serializeParam(
          _epidemicSoundToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static EpidemicSoundStruct fromSerializableMap(Map<String, dynamic> data) =>
      EpidemicSoundStruct(
        tracks: deserializeParam<String>(
          data['Tracks'],
          ParamType.String,
          true,
        ),
        albums: deserializeParam<String>(
          data['Albums'],
          ParamType.String,
          true,
        ),
        epidemicSoundToken: deserializeParam(
          data['EpidemicSoundToken'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EpidemicSoundStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EpidemicSoundStruct &&
        listEquality.equals(tracks, other.tracks) &&
        listEquality.equals(albums, other.albums) &&
        epidemicSoundToken == other.epidemicSoundToken;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tracks, albums, epidemicSoundToken]);
}

EpidemicSoundStruct createEpidemicSoundStruct({
  String? epidemicSoundToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EpidemicSoundStruct(
      epidemicSoundToken: epidemicSoundToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EpidemicSoundStruct? updateEpidemicSoundStruct(
  EpidemicSoundStruct? epidemicSound, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    epidemicSound
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEpidemicSoundStructData(
  Map<String, dynamic> firestoreData,
  EpidemicSoundStruct? epidemicSound,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (epidemicSound == null) {
    return;
  }
  if (epidemicSound.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && epidemicSound.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final epidemicSoundData =
      getEpidemicSoundFirestoreData(epidemicSound, forFieldValue);
  final nestedData =
      epidemicSoundData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = epidemicSound.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEpidemicSoundFirestoreData(
  EpidemicSoundStruct? epidemicSound, [
  bool forFieldValue = false,
]) {
  if (epidemicSound == null) {
    return {};
  }
  final firestoreData = mapToFirestore(epidemicSound.toMap());

  // Add any Firestore field values
  epidemicSound.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEpidemicSoundListFirestoreData(
  List<EpidemicSoundStruct>? epidemicSounds,
) =>
    epidemicSounds
        ?.map((e) => getEpidemicSoundFirestoreData(e, true))
        .toList() ??
    [];
