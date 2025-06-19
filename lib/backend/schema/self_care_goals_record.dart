import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelfCareGoalsRecord extends FirestoreRecord {
  SelfCareGoalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "completionDate" field.
  DateTime? _completionDate;
  DateTime? get completionDate => _completionDate;
  bool hasCompletionDate() => _completionDate != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "GoalTitle" field.
  String? _goalTitle;
  String get goalTitle => _goalTitle ?? '';
  bool hasGoalTitle() => _goalTitle != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "GoalID" field.
  String? _goalID;
  String get goalID => _goalID ?? '';
  bool hasGoalID() => _goalID != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _completionDate = snapshotData['completionDate'] as DateTime?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _goalTitle = snapshotData['GoalTitle'] as String?;
    _description = snapshotData['Description'] as String?;
    _goalID = snapshotData['GoalID'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SelfCareGoals');

  static Stream<SelfCareGoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SelfCareGoalsRecord.fromSnapshot(s));

  static Future<SelfCareGoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SelfCareGoalsRecord.fromSnapshot(s));

  static SelfCareGoalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SelfCareGoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SelfCareGoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SelfCareGoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SelfCareGoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SelfCareGoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSelfCareGoalsRecordData({
  String? status,
  DateTime? completionDate,
  DocumentReference? userID,
  String? goalTitle,
  String? description,
  String? goalID,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'completionDate': completionDate,
      'userID': userID,
      'GoalTitle': goalTitle,
      'Description': description,
      'GoalID': goalID,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class SelfCareGoalsRecordDocumentEquality
    implements Equality<SelfCareGoalsRecord> {
  const SelfCareGoalsRecordDocumentEquality();

  @override
  bool equals(SelfCareGoalsRecord? e1, SelfCareGoalsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.completionDate == e2?.completionDate &&
        e1?.userID == e2?.userID &&
        e1?.goalTitle == e2?.goalTitle &&
        e1?.description == e2?.description &&
        e1?.goalID == e2?.goalID &&
        e1?.user == e2?.user;
  }

  @override
  int hash(SelfCareGoalsRecord? e) => const ListEquality().hash([
        e?.status,
        e?.completionDate,
        e?.userID,
        e?.goalTitle,
        e?.description,
        e?.goalID,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is SelfCareGoalsRecord;
}
