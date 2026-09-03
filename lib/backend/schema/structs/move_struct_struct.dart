// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoveStructStruct extends FFFirebaseStruct {
  MoveStructStruct({
    String? name,
    String? moveType,
    int? durationSeconds,
    int? repCount,
    String? cueText,
    String? modelUrl,
    Color? accentColor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _moveType = moveType,
        _durationSeconds = durationSeconds,
        _repCount = repCount,
        _cueText = cueText,
        _modelUrl = modelUrl,
        _accentColor = accentColor,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "moveType" field.
  String? _moveType;
  String get moveType => _moveType ?? '';
  set moveType(String? val) => _moveType = val;

  bool hasMoveType() => _moveType != null;

  // "durationSeconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  set durationSeconds(int? val) => _durationSeconds = val;

  void incrementDurationSeconds(int amount) =>
      durationSeconds = durationSeconds + amount;

  bool hasDurationSeconds() => _durationSeconds != null;

  // "repCount" field.
  int? _repCount;
  int get repCount => _repCount ?? 0;
  set repCount(int? val) => _repCount = val;

  void incrementRepCount(int amount) => repCount = repCount + amount;

  bool hasRepCount() => _repCount != null;

  // "cueText" field.
  String? _cueText;
  String get cueText => _cueText ?? '';
  set cueText(String? val) => _cueText = val;

  bool hasCueText() => _cueText != null;

  // "modelUrl" field.
  String? _modelUrl;
  String get modelUrl => _modelUrl ?? '';
  set modelUrl(String? val) => _modelUrl = val;

  bool hasModelUrl() => _modelUrl != null;

  // "accentColor" field.
  Color? _accentColor;
  Color? get accentColor => _accentColor;
  set accentColor(Color? val) => _accentColor = val;

  bool hasAccentColor() => _accentColor != null;

  static MoveStructStruct fromMap(Map<String, dynamic> data) =>
      MoveStructStruct(
        name: data['name'] as String?,
        moveType: data['moveType'] as String?,
        durationSeconds: castToType<int>(data['durationSeconds']),
        repCount: castToType<int>(data['repCount']),
        cueText: data['cueText'] as String?,
        modelUrl: data['modelUrl'] as String?,
        accentColor: getSchemaColor(data['accentColor']),
      );

  static MoveStructStruct? maybeFromMap(dynamic data) => data is Map
      ? MoveStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'moveType': _moveType,
        'durationSeconds': _durationSeconds,
        'repCount': _repCount,
        'cueText': _cueText,
        'modelUrl': _modelUrl,
        'accentColor': _accentColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'moveType': serializeParam(
          _moveType,
          ParamType.String,
        ),
        'durationSeconds': serializeParam(
          _durationSeconds,
          ParamType.int,
        ),
        'repCount': serializeParam(
          _repCount,
          ParamType.int,
        ),
        'cueText': serializeParam(
          _cueText,
          ParamType.String,
        ),
        'modelUrl': serializeParam(
          _modelUrl,
          ParamType.String,
        ),
        'accentColor': serializeParam(
          _accentColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static MoveStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      MoveStructStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        moveType: deserializeParam(
          data['moveType'],
          ParamType.String,
          false,
        ),
        durationSeconds: deserializeParam(
          data['durationSeconds'],
          ParamType.int,
          false,
        ),
        repCount: deserializeParam(
          data['repCount'],
          ParamType.int,
          false,
        ),
        cueText: deserializeParam(
          data['cueText'],
          ParamType.String,
          false,
        ),
        modelUrl: deserializeParam(
          data['modelUrl'],
          ParamType.String,
          false,
        ),
        accentColor: deserializeParam(
          data['accentColor'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'MoveStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MoveStructStruct &&
        name == other.name &&
        moveType == other.moveType &&
        durationSeconds == other.durationSeconds &&
        repCount == other.repCount &&
        cueText == other.cueText &&
        modelUrl == other.modelUrl &&
        accentColor == other.accentColor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        moveType,
        durationSeconds,
        repCount,
        cueText,
        modelUrl,
        accentColor
      ]);
}

MoveStructStruct createMoveStructStruct({
  String? name,
  String? moveType,
  int? durationSeconds,
  int? repCount,
  String? cueText,
  String? modelUrl,
  Color? accentColor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MoveStructStruct(
      name: name,
      moveType: moveType,
      durationSeconds: durationSeconds,
      repCount: repCount,
      cueText: cueText,
      modelUrl: modelUrl,
      accentColor: accentColor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MoveStructStruct? updateMoveStructStruct(
  MoveStructStruct? moveStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    moveStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMoveStructStructData(
  Map<String, dynamic> firestoreData,
  MoveStructStruct? moveStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (moveStruct == null) {
    return;
  }
  if (moveStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && moveStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final moveStructData = getMoveStructFirestoreData(moveStruct, forFieldValue);
  final nestedData = moveStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = moveStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMoveStructFirestoreData(
  MoveStructStruct? moveStruct, [
  bool forFieldValue = false,
]) {
  if (moveStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(moveStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(moveStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMoveStructListFirestoreData(
  List<MoveStructStruct>? moveStructs,
) =>
    moveStructs?.map((e) => getMoveStructFirestoreData(e, true)).toList() ?? [];
