import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JournalRecord extends FirestoreRecord {
  JournalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ImprovingThoughts" field.
  String? _improvingThoughts;
  String get improvingThoughts => _improvingThoughts ?? '';
  bool hasImprovingThoughts() => _improvingThoughts != null;

  // "Moods" field.
  String? _moods;
  String get moods => _moods ?? '';
  bool hasMoods() => _moods != null;

  // "MoodPhoto" field.
  String? _moodPhoto;
  String get moodPhoto => _moodPhoto ?? '';
  bool hasMoodPhoto() => _moodPhoto != null;

  // "isMeditationComplete" field.
  bool? _isMeditationComplete;
  bool get isMeditationComplete => _isMeditationComplete ?? false;
  bool hasIsMeditationComplete() => _isMeditationComplete != null;

  // "isYogaComplete" field.
  bool? _isYogaComplete;
  bool get isYogaComplete => _isYogaComplete ?? false;
  bool hasIsYogaComplete() => _isYogaComplete != null;

  // "NumberOfMeditationsCompleted" field.
  int? _numberOfMeditationsCompleted;
  int get numberOfMeditationsCompleted => _numberOfMeditationsCompleted ?? 0;
  bool hasNumberOfMeditationsCompleted() =>
      _numberOfMeditationsCompleted != null;

  // "NumberOfMentalCompleted" field.
  int? _numberOfMentalCompleted;
  int get numberOfMentalCompleted => _numberOfMentalCompleted ?? 0;
  bool hasNumberOfMentalCompleted() => _numberOfMentalCompleted != null;

  // "NumberOfBodyCompleted" field.
  int? _numberOfBodyCompleted;
  int get numberOfBodyCompleted => _numberOfBodyCompleted ?? 0;
  bool hasNumberOfBodyCompleted() => _numberOfBodyCompleted != null;

  // "ThoughtsOfGratitude" field.
  String? _thoughtsOfGratitude;
  String get thoughtsOfGratitude => _thoughtsOfGratitude ?? '';
  bool hasThoughtsOfGratitude() => _thoughtsOfGratitude != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _improvingThoughts = snapshotData['ImprovingThoughts'] as String?;
    _moods = snapshotData['Moods'] as String?;
    _moodPhoto = snapshotData['MoodPhoto'] as String?;
    _isMeditationComplete = snapshotData['isMeditationComplete'] as bool?;
    _isYogaComplete = snapshotData['isYogaComplete'] as bool?;
    _numberOfMeditationsCompleted =
        castToType<int>(snapshotData['NumberOfMeditationsCompleted']);
    _numberOfMentalCompleted =
        castToType<int>(snapshotData['NumberOfMentalCompleted']);
    _numberOfBodyCompleted =
        castToType<int>(snapshotData['NumberOfBodyCompleted']);
    _thoughtsOfGratitude = snapshotData['ThoughtsOfGratitude'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Journal')
          : FirebaseFirestore.instance.collectionGroup('Journal');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Journal').doc(id);

  static Stream<JournalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JournalRecord.fromSnapshot(s));

  static Future<JournalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JournalRecord.fromSnapshot(s));

  static JournalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JournalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JournalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JournalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JournalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JournalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJournalRecordData({
  String? improvingThoughts,
  String? moods,
  String? moodPhoto,
  bool? isMeditationComplete,
  bool? isYogaComplete,
  int? numberOfMeditationsCompleted,
  int? numberOfMentalCompleted,
  int? numberOfBodyCompleted,
  String? thoughtsOfGratitude,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ImprovingThoughts': improvingThoughts,
      'Moods': moods,
      'MoodPhoto': moodPhoto,
      'isMeditationComplete': isMeditationComplete,
      'isYogaComplete': isYogaComplete,
      'NumberOfMeditationsCompleted': numberOfMeditationsCompleted,
      'NumberOfMentalCompleted': numberOfMentalCompleted,
      'NumberOfBodyCompleted': numberOfBodyCompleted,
      'ThoughtsOfGratitude': thoughtsOfGratitude,
    }.withoutNulls,
  );

  return firestoreData;
}

class JournalRecordDocumentEquality implements Equality<JournalRecord> {
  const JournalRecordDocumentEquality();

  @override
  bool equals(JournalRecord? e1, JournalRecord? e2) {
    return e1?.improvingThoughts == e2?.improvingThoughts &&
        e1?.moods == e2?.moods &&
        e1?.moodPhoto == e2?.moodPhoto &&
        e1?.isMeditationComplete == e2?.isMeditationComplete &&
        e1?.isYogaComplete == e2?.isYogaComplete &&
        e1?.numberOfMeditationsCompleted == e2?.numberOfMeditationsCompleted &&
        e1?.numberOfMentalCompleted == e2?.numberOfMentalCompleted &&
        e1?.numberOfBodyCompleted == e2?.numberOfBodyCompleted &&
        e1?.thoughtsOfGratitude == e2?.thoughtsOfGratitude;
  }

  @override
  int hash(JournalRecord? e) => const ListEquality().hash([
        e?.improvingThoughts,
        e?.moods,
        e?.moodPhoto,
        e?.isMeditationComplete,
        e?.isYogaComplete,
        e?.numberOfMeditationsCompleted,
        e?.numberOfMentalCompleted,
        e?.numberOfBodyCompleted,
        e?.thoughtsOfGratitude
      ]);

  @override
  bool isValidKey(Object? o) => o is JournalRecord;
}
