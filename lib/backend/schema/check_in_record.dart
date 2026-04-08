import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckInRecord extends FirestoreRecord {
  CheckInRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "FeelingsScore" field.
  double? _feelingsScore;
  double get feelingsScore => _feelingsScore ?? 0.0;
  bool hasFeelingsScore() => _feelingsScore != null;

  // "SleepPatterns" field.
  double? _sleepPatterns;
  double get sleepPatterns => _sleepPatterns ?? 0.0;
  bool hasSleepPatterns() => _sleepPatterns != null;

  // "EnergyLevelScore" field.
  double? _energyLevelScore;
  double get energyLevelScore => _energyLevelScore ?? 0.0;
  bool hasEnergyLevelScore() => _energyLevelScore != null;

  // "StressLevel" field.
  String? _stressLevel;
  String get stressLevel => _stressLevel ?? '';
  bool hasStressLevel() => _stressLevel != null;

  // "SupportLevel" field.
  String? _supportLevel;
  String get supportLevel => _supportLevel ?? '';
  bool hasSupportLevel() => _supportLevel != null;

  // "OverallRating" field.
  double? _overallRating;
  double get overallRating => _overallRating ?? 0.0;
  bool hasOverallRating() => _overallRating != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _feelingsScore = castToType<double>(snapshotData['FeelingsScore']);
    _sleepPatterns = castToType<double>(snapshotData['SleepPatterns']);
    _energyLevelScore = castToType<double>(snapshotData['EnergyLevelScore']);
    _stressLevel = snapshotData['StressLevel'] as String?;
    _supportLevel = snapshotData['SupportLevel'] as String?;
    _overallRating = castToType<double>(snapshotData['OverallRating']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Check-In')
          : FirebaseFirestore.instance.collectionGroup('Check-In');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Check-In').doc(id);

  static Stream<CheckInRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckInRecord.fromSnapshot(s));

  static Future<CheckInRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CheckInRecord.fromSnapshot(s));

  static CheckInRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckInRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckInRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckInRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckInRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckInRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckInRecordData({
  DateTime? createdTime,
  double? feelingsScore,
  double? sleepPatterns,
  double? energyLevelScore,
  String? stressLevel,
  String? supportLevel,
  double? overallRating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'FeelingsScore': feelingsScore,
      'SleepPatterns': sleepPatterns,
      'EnergyLevelScore': energyLevelScore,
      'StressLevel': stressLevel,
      'SupportLevel': supportLevel,
      'OverallRating': overallRating,
    }.withoutNulls,
  );

  return firestoreData;
}

class CheckInRecordDocumentEquality implements Equality<CheckInRecord> {
  const CheckInRecordDocumentEquality();

  @override
  bool equals(CheckInRecord? e1, CheckInRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.feelingsScore == e2?.feelingsScore &&
        e1?.sleepPatterns == e2?.sleepPatterns &&
        e1?.energyLevelScore == e2?.energyLevelScore &&
        e1?.stressLevel == e2?.stressLevel &&
        e1?.supportLevel == e2?.supportLevel &&
        e1?.overallRating == e2?.overallRating;
  }

  @override
  int hash(CheckInRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.feelingsScore,
        e?.sleepPatterns,
        e?.energyLevelScore,
        e?.stressLevel,
        e?.supportLevel,
        e?.overallRating
      ]);

  @override
  bool isValidKey(Object? o) => o is CheckInRecord;
}
