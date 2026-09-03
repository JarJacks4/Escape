import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BodyRecord extends FirestoreRecord {
  BodyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "weeklyTarget" field.
  int? _weeklyTarget;
  int get weeklyTarget => _weeklyTarget ?? 0;
  bool hasWeeklyTarget() => _weeklyTarget != null;

  // "currentWeekCount" field.
  int? _currentWeekCount;
  int get currentWeekCount => _currentWeekCount ?? 0;
  bool hasCurrentWeekCount() => _currentWeekCount != null;

  // "weekStartDate" field.
  DateTime? _weekStartDate;
  DateTime? get weekStartDate => _weekStartDate;
  bool hasWeekStartDate() => _weekStartDate != null;

  // "streakCount" field.
  int? _streakCount;
  int get streakCount => _streakCount ?? 0;
  bool hasStreakCount() => _streakCount != null;

  // "lastCompletedDate" field.
  DateTime? _lastCompletedDate;
  DateTime? get lastCompletedDate => _lastCompletedDate;
  bool hasLastCompletedDate() => _lastCompletedDate != null;

  // "totalCompletions" field.
  int? _totalCompletions;
  int get totalCompletions => _totalCompletions ?? 0;
  bool hasTotalCompletions() => _totalCompletions != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _weeklyTarget = castToType<int>(snapshotData['weeklyTarget']);
    _currentWeekCount = castToType<int>(snapshotData['currentWeekCount']);
    _weekStartDate = snapshotData['weekStartDate'] as DateTime?;
    _streakCount = castToType<int>(snapshotData['streakCount']);
    _lastCompletedDate = snapshotData['lastCompletedDate'] as DateTime?;
    _totalCompletions = castToType<int>(snapshotData['totalCompletions']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Body')
          : FirebaseFirestore.instance.collectionGroup('Body');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Body').doc(id);

  static Stream<BodyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BodyRecord.fromSnapshot(s));

  static Future<BodyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BodyRecord.fromSnapshot(s));

  static BodyRecord fromSnapshot(DocumentSnapshot snapshot) => BodyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BodyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BodyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BodyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BodyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBodyRecordData({
  int? weeklyTarget,
  int? currentWeekCount,
  DateTime? weekStartDate,
  int? streakCount,
  DateTime? lastCompletedDate,
  int? totalCompletions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'weeklyTarget': weeklyTarget,
      'currentWeekCount': currentWeekCount,
      'weekStartDate': weekStartDate,
      'streakCount': streakCount,
      'lastCompletedDate': lastCompletedDate,
      'totalCompletions': totalCompletions,
    }.withoutNulls,
  );

  return firestoreData;
}

class BodyRecordDocumentEquality implements Equality<BodyRecord> {
  const BodyRecordDocumentEquality();

  @override
  bool equals(BodyRecord? e1, BodyRecord? e2) {
    return e1?.weeklyTarget == e2?.weeklyTarget &&
        e1?.currentWeekCount == e2?.currentWeekCount &&
        e1?.weekStartDate == e2?.weekStartDate &&
        e1?.streakCount == e2?.streakCount &&
        e1?.lastCompletedDate == e2?.lastCompletedDate &&
        e1?.totalCompletions == e2?.totalCompletions;
  }

  @override
  int hash(BodyRecord? e) => const ListEquality().hash([
        e?.weeklyTarget,
        e?.currentWeekCount,
        e?.weekStartDate,
        e?.streakCount,
        e?.lastCompletedDate,
        e?.totalCompletions
      ]);

  @override
  bool isValidKey(Object? o) => o is BodyRecord;
}
