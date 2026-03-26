// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LucilleSoundsDataStruct extends FFFirebaseStruct {
  LucilleSoundsDataStruct({
    List<Soundscapes1Struct>? soundscapes,
    int? count,
    String? categoryFilter,
    String? status,
    String? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _soundscapes = soundscapes,
        _count = count,
        _categoryFilter = categoryFilter,
        _status = status,
        _timestamp = timestamp,
        super(firestoreUtilData);

  // "soundscapes" field.
  List<Soundscapes1Struct>? _soundscapes;
  List<Soundscapes1Struct> get soundscapes => _soundscapes ?? const [];
  set soundscapes(List<Soundscapes1Struct>? val) => _soundscapes = val;

  void updateSoundscapes(Function(List<Soundscapes1Struct>) updateFn) {
    updateFn(_soundscapes ??= []);
  }

  bool hasSoundscapes() => _soundscapes != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "category_filter" field.
  String? _categoryFilter;
  String get categoryFilter => _categoryFilter ?? '';
  set categoryFilter(String? val) => _categoryFilter = val;

  bool hasCategoryFilter() => _categoryFilter != null;

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

  static LucilleSoundsDataStruct fromMap(Map<String, dynamic> data) =>
      LucilleSoundsDataStruct(
        soundscapes: getStructList(
          data['soundscapes'],
          Soundscapes1Struct.fromMap,
        ),
        count: castToType<int>(data['count']),
        categoryFilter: data['category_filter'] as String?,
        status: data['status'] as String?,
        timestamp: data['timestamp'] as String?,
      );

  static LucilleSoundsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LucilleSoundsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'soundscapes': _soundscapes?.map((e) => e.toMap()).toList(),
        'count': _count,
        'category_filter': _categoryFilter,
        'status': _status,
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'soundscapes': serializeParam(
          _soundscapes,
          ParamType.DataStruct,
          isList: true,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'category_filter': serializeParam(
          _categoryFilter,
          ParamType.String,
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

  static LucilleSoundsDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LucilleSoundsDataStruct(
        soundscapes: deserializeStructParam<Soundscapes1Struct>(
          data['soundscapes'],
          ParamType.DataStruct,
          true,
          structBuilder: Soundscapes1Struct.fromSerializableMap,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        categoryFilter: deserializeParam(
          data['category_filter'],
          ParamType.String,
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
  String toString() => 'LucilleSoundsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LucilleSoundsDataStruct &&
        listEquality.equals(soundscapes, other.soundscapes) &&
        count == other.count &&
        categoryFilter == other.categoryFilter &&
        status == other.status &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([soundscapes, count, categoryFilter, status, timestamp]);
}

LucilleSoundsDataStruct createLucilleSoundsDataStruct({
  int? count,
  String? categoryFilter,
  String? status,
  String? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LucilleSoundsDataStruct(
      count: count,
      categoryFilter: categoryFilter,
      status: status,
      timestamp: timestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LucilleSoundsDataStruct? updateLucilleSoundsDataStruct(
  LucilleSoundsDataStruct? lucilleSoundsData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lucilleSoundsData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLucilleSoundsDataStructData(
  Map<String, dynamic> firestoreData,
  LucilleSoundsDataStruct? lucilleSoundsData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lucilleSoundsData == null) {
    return;
  }
  if (lucilleSoundsData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lucilleSoundsData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lucilleSoundsDataData =
      getLucilleSoundsDataFirestoreData(lucilleSoundsData, forFieldValue);
  final nestedData =
      lucilleSoundsDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lucilleSoundsData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLucilleSoundsDataFirestoreData(
  LucilleSoundsDataStruct? lucilleSoundsData, [
  bool forFieldValue = false,
]) {
  if (lucilleSoundsData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lucilleSoundsData.toMap());

  // Add any Firestore field values
  lucilleSoundsData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLucilleSoundsDataListFirestoreData(
  List<LucilleSoundsDataStruct>? lucilleSoundsDatas,
) =>
    lucilleSoundsDatas
        ?.map((e) => getLucilleSoundsDataFirestoreData(e, true))
        .toList() ??
    [];
