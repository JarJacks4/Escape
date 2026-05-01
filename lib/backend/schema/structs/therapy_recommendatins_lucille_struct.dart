// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TherapyRecommendatinsLucilleStruct extends FFFirebaseStruct {
  TherapyRecommendatinsLucilleStruct({
    String? userId,
    String? detectedEmotion,
    String? detectedIntent,
    List<RecommendationsStruct>? recommendations,
    int? count,
    String? status,
    String? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _detectedEmotion = detectedEmotion,
        _detectedIntent = detectedIntent,
        _recommendations = recommendations,
        _count = count,
        _status = status,
        _timestamp = timestamp,
        super(firestoreUtilData);

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "detected_emotion" field.
  String? _detectedEmotion;
  String get detectedEmotion => _detectedEmotion ?? '';
  set detectedEmotion(String? val) => _detectedEmotion = val;

  bool hasDetectedEmotion() => _detectedEmotion != null;

  // "detected_intent" field.
  String? _detectedIntent;
  String get detectedIntent => _detectedIntent ?? '';
  set detectedIntent(String? val) => _detectedIntent = val;

  bool hasDetectedIntent() => _detectedIntent != null;

  // "recommendations" field.
  List<RecommendationsStruct>? _recommendations;
  List<RecommendationsStruct> get recommendations =>
      _recommendations ?? const [];
  set recommendations(List<RecommendationsStruct>? val) =>
      _recommendations = val;

  void updateRecommendations(Function(List<RecommendationsStruct>) updateFn) {
    updateFn(_recommendations ??= []);
  }

  bool hasRecommendations() => _recommendations != null;

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

  static TherapyRecommendatinsLucilleStruct fromMap(
          Map<String, dynamic> data) =>
      TherapyRecommendatinsLucilleStruct(
        userId: data['user_id'] as String?,
        detectedEmotion: data['detected_emotion'] as String?,
        detectedIntent: data['detected_intent'] as String?,
        recommendations: getStructList(
          data['recommendations'],
          RecommendationsStruct.fromMap,
        ),
        count: castToType<int>(data['count']),
        status: data['status'] as String?,
        timestamp: data['timestamp'] as String?,
      );

  static TherapyRecommendatinsLucilleStruct? maybeFromMap(dynamic data) => data
          is Map
      ? TherapyRecommendatinsLucilleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'detected_emotion': _detectedEmotion,
        'detected_intent': _detectedIntent,
        'recommendations': _recommendations?.map((e) => e.toMap()).toList(),
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
        'detected_emotion': serializeParam(
          _detectedEmotion,
          ParamType.String,
        ),
        'detected_intent': serializeParam(
          _detectedIntent,
          ParamType.String,
        ),
        'recommendations': serializeParam(
          _recommendations,
          ParamType.DataStruct,
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

  static TherapyRecommendatinsLucilleStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TherapyRecommendatinsLucilleStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        detectedEmotion: deserializeParam(
          data['detected_emotion'],
          ParamType.String,
          false,
        ),
        detectedIntent: deserializeParam(
          data['detected_intent'],
          ParamType.String,
          false,
        ),
        recommendations: deserializeStructParam<RecommendationsStruct>(
          data['recommendations'],
          ParamType.DataStruct,
          true,
          structBuilder: RecommendationsStruct.fromSerializableMap,
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
  String toString() => 'TherapyRecommendatinsLucilleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TherapyRecommendatinsLucilleStruct &&
        userId == other.userId &&
        detectedEmotion == other.detectedEmotion &&
        detectedIntent == other.detectedIntent &&
        listEquality.equals(recommendations, other.recommendations) &&
        count == other.count &&
        status == other.status &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        detectedEmotion,
        detectedIntent,
        recommendations,
        count,
        status,
        timestamp
      ]);
}

TherapyRecommendatinsLucilleStruct createTherapyRecommendatinsLucilleStruct({
  String? userId,
  String? detectedEmotion,
  String? detectedIntent,
  int? count,
  String? status,
  String? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TherapyRecommendatinsLucilleStruct(
      userId: userId,
      detectedEmotion: detectedEmotion,
      detectedIntent: detectedIntent,
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

TherapyRecommendatinsLucilleStruct? updateTherapyRecommendatinsLucilleStruct(
  TherapyRecommendatinsLucilleStruct? therapyRecommendatinsLucille, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    therapyRecommendatinsLucille
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTherapyRecommendatinsLucilleStructData(
  Map<String, dynamic> firestoreData,
  TherapyRecommendatinsLucilleStruct? therapyRecommendatinsLucille,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (therapyRecommendatinsLucille == null) {
    return;
  }
  if (therapyRecommendatinsLucille.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      therapyRecommendatinsLucille.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final therapyRecommendatinsLucilleData =
      getTherapyRecommendatinsLucilleFirestoreData(
          therapyRecommendatinsLucille, forFieldValue);
  final nestedData = therapyRecommendatinsLucilleData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      therapyRecommendatinsLucille.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTherapyRecommendatinsLucilleFirestoreData(
  TherapyRecommendatinsLucilleStruct? therapyRecommendatinsLucille, [
  bool forFieldValue = false,
]) {
  if (therapyRecommendatinsLucille == null) {
    return {};
  }
  final firestoreData = mapToFirestore(therapyRecommendatinsLucille.toMap());

  // Add any Firestore field values
  mapToFirestore(therapyRecommendatinsLucille.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTherapyRecommendatinsLucilleListFirestoreData(
  List<TherapyRecommendatinsLucilleStruct>? therapyRecommendatinsLucilles,
) =>
    therapyRecommendatinsLucilles
        ?.map((e) => getTherapyRecommendatinsLucilleFirestoreData(e, true))
        .toList() ??
    [];
