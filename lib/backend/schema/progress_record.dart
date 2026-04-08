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

  // "completionDate" field.
  String? _completionDate;
  String get completionDate => _completionDate ?? '';
  bool hasCompletionDate() => _completionDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _progressID = snapshotData['progressID'] as String?;
    _userID = snapshotData['UserID'] as DocumentReference?;
    _goalID = snapshotData['goalID'] as DocumentReference?;
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
  String? completionDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'progressID': progressID,
      'UserID': userID,
      'goalID': goalID,
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
        e1?.completionDate == e2?.completionDate;
  }

  @override
  int hash(ProgressRecord? e) => const ListEquality()
      .hash([e?.progressID, e?.userID, e?.goalID, e?.completionDate]);

  @override
  bool isValidKey(Object? o) => o is ProgressRecord;
}
