// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LucilleMemoriesStruct extends FFFirebaseStruct {
  LucilleMemoriesStruct({
    String? userId,
    List<String>? memories,
    int? count,
    String? status,
    String? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _memories = memories,
        _count = count,
        _status = status,
        _timestamp = timestamp,
        super(firestoreUtilData);

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "memories" field.
  List<String>? _memories;
  List<String> get memories => _memories ?? const [];
  set memories(List<String>? val) => _memories = val;

  void updateMemories(Function(List<String>) updateFn) {
    updateFn(_memories ??= []);
  }

  bool hasMemories() => _memories != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  set timestamp(String? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static LucilleMemoriesStruct fromMap(Map<String, dynamic> data) =>
      LucilleMemoriesStruct(
        userId: data['user_id'] as String?,
        memories: getDataList(data['memories']),
        count: castToType<int>(data['count']),
        status: data['status'] as String?,
        timestamp: data['timestamp'] as String?,
      );

  static LucilleMemoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? LucilleMemoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'memories': _memories,
        'count': _count,
        'status': _status,
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'memories': serializeParam(
          _memories,
          ParamType.String,
          isList: true,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.String,
        ),
      }.withoutNulls;

  static LucilleMemoriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      LucilleMemoriesStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        memories: deserializeParam<String>(
          data['memories'],
          ParamType.String,
          true,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LucilleMemoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LucilleMemoriesStruct &&
        userId == other.userId &&
        listEquality.equals(memories, other.memories) &&
        count == other.count &&
        status == other.status &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userId, memories, count, status, timestamp]);
}

LucilleMemoriesStruct createLucilleMemoriesStruct({
  String? userId,
  int? count,
  String? status,
  String? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LucilleMemoriesStruct(
      userId: userId,
      count: count,
      status: status,
      timestamp: timestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LucilleMemoriesStruct? updateLucilleMemoriesStruct(
  LucilleMemoriesStruct? lucilleMemories, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lucilleMemories
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLucilleMemoriesStructData(
  Map<String, dynamic> firestoreData,
  LucilleMemoriesStruct? lucilleMemories,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lucilleMemories == null) {
    return;
  }
  if (lucilleMemories.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lucilleMemories.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lucilleMemoriesData =
      getLucilleMemoriesFirestoreData(lucilleMemories, forFieldValue);
  final nestedData =
      lucilleMemoriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lucilleMemories.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLucilleMemoriesFirestoreData(
  LucilleMemoriesStruct? lucilleMemories, [
  bool forFieldValue = false,
]) {
  if (lucilleMemories == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lucilleMemories.toMap());

  // Add any Firestore field values
  mapToFirestore(lucilleMemories.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLucilleMemoriesListFirestoreData(
  List<LucilleMemoriesStruct>? lucilleMemoriess,
) =>
    lucilleMemoriess
        ?.map((e) => getLucilleMemoriesFirestoreData(e, true))
        .toList() ??
    [];
