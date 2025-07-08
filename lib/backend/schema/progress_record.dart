import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgressRecord extends FirestoreRecord {
  ProgressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "progressID" field.
  String? _progressID;
  String get progressID => _progressID ?? '';
  bool hasProgressID() => _progressID != null;

  // "UserID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "goalID" field.
  DocumentReference? _goalID;
  DocumentReference? get goalID => _goalID;
  bool hasGoalID() => _goalID != null;

  // "meditationSessionID" field.
  DocumentReference? _meditationSessionID;
  DocumentReference? get meditationSessionID => _meditationSessionID;
  bool hasMeditationSessionID() => _meditationSessionID != null;

  // "completionDate" field.
  String? _completionDate;
  String get completionDate => _completionDate ?? '';
  bool hasCompletionDate() => _completionDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _progressID = snapshotData['progressID'] as String?;
    _userID = snapshotData['UserID'] as DocumentReference?;
    _goalID = snapshotData['goalID'] as DocumentReference?;
    _meditationSessionID =
        snapshotData['meditationSessionID'] as DocumentReference?;
    _completionDate = snapshotData['completionDate'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Progress')
          : FirebaseFirestore.instance.collectionGroup('Progress');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Progress').doc(id);

  static Stream<ProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgressRecord.fromSnapshot(s));

  static Future<ProgressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgressRecord.fromSnapshot(s));

  static ProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgressRecordData({
  String? progressID,
  DocumentReference? userID,
  DocumentReference? goalID,
  DocumentReference? meditationSessionID,
  String? completionDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'progressID': progressID,
      'UserID': userID,
      'goalID': goalID,
      'meditationSessionID': meditationSessionID,
      'completionDate': completionDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgressRecordDocumentEquality implements Equality<ProgressRecord> {
  const ProgressRecordDocumentEquality();

  @override
  bool equals(ProgressRecord? e1, ProgressRecord? e2) {
    return e1?.progressID == e2?.progressID &&
        e1?.userID == e2?.userID &&
        e1?.goalID == e2?.goalID &&
        e1?.meditationSessionID == e2?.meditationSessionID &&
        e1?.completionDate == e2?.completionDate;
  }

  @override
  int hash(ProgressRecord? e) => const ListEquality().hash([
        e?.progressID,
        e?.userID,
        e?.goalID,
        e?.meditationSessionID,
        e?.completionDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgressRecord;
}
