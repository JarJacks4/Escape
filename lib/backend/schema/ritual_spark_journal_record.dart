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

class RitualSparkJournalRecord extends FirestoreRecord {
  RitualSparkJournalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RitualSparkTitle" field.
  String? _ritualSparkTitle;
  String get ritualSparkTitle => _ritualSparkTitle ?? '';
  bool hasRitualSparkTitle() => _ritualSparkTitle != null;

  // "RitualSparkContent" field.
  String? _ritualSparkContent;
  String get ritualSparkContent => _ritualSparkContent ?? '';
  bool hasRitualSparkContent() => _ritualSparkContent != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "RitualSparkPhoto" field.
  String? _ritualSparkPhoto;
  String get ritualSparkPhoto => _ritualSparkPhoto ?? '';
  bool hasRitualSparkPhoto() => _ritualSparkPhoto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ritualSparkTitle = snapshotData['RitualSparkTitle'] as String?;
    _ritualSparkContent = snapshotData['RitualSparkContent'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _ritualSparkPhoto = snapshotData['RitualSparkPhoto'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('RitualSparkJournal')
          : FirebaseFirestore.instance.collectionGroup('RitualSparkJournal');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('RitualSparkJournal').doc(id);

  static Stream<RitualSparkJournalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RitualSparkJournalRecord.fromSnapshot(s));

  static Future<RitualSparkJournalRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RitualSparkJournalRecord.fromSnapshot(s));

  static RitualSparkJournalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RitualSparkJournalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RitualSparkJournalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RitualSparkJournalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RitualSparkJournalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RitualSparkJournalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRitualSparkJournalRecordData({
  String? ritualSparkTitle,
  String? ritualSparkContent,
  String? ritualSparkPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RitualSparkTitle': ritualSparkTitle,
      'RitualSparkContent': ritualSparkContent,
      'RitualSparkPhoto': ritualSparkPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class RitualSparkJournalRecordDocumentEquality
    implements Equality<RitualSparkJournalRecord> {
  const RitualSparkJournalRecordDocumentEquality();

  @override
  bool equals(RitualSparkJournalRecord? e1, RitualSparkJournalRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ritualSparkTitle == e2?.ritualSparkTitle &&
        e1?.ritualSparkContent == e2?.ritualSparkContent &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.ritualSparkPhoto == e2?.ritualSparkPhoto;
  }

  @override
  int hash(RitualSparkJournalRecord? e) => const ListEquality().hash([
        e?.ritualSparkTitle,
        e?.ritualSparkContent,
        e?.tags,
        e?.ritualSparkPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is RitualSparkJournalRecord;
}
