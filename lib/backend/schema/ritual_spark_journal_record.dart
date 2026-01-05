import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ritualSparkTitle = snapshotData['RitualSparkTitle'] as String?;
    _ritualSparkContent = snapshotData['RitualSparkContent'] as String?;
    _tags = getDataList(snapshotData['tags']);
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
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RitualSparkTitle': ritualSparkTitle,
      'RitualSparkContent': ritualSparkContent,
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
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(RitualSparkJournalRecord? e) => const ListEquality()
      .hash([e?.ritualSparkTitle, e?.ritualSparkContent, e?.tags]);

  @override
  bool isValidKey(Object? o) => o is RitualSparkJournalRecord;
}
