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

  // "DisplayName" field.
  DocumentReference? _displayName;
  DocumentReference? get displayName => _displayName;
  bool hasDisplayName() => _displayName != null;

  // "JournalTitle" field.
  String? _journalTitle;
  String get journalTitle => _journalTitle ?? '';
  bool hasJournalTitle() => _journalTitle != null;

  // "JournalContent" field.
  String? _journalContent;
  String get journalContent => _journalContent ?? '';
  bool hasJournalContent() => _journalContent != null;

  // "JournalPhoto" field.
  String? _journalPhoto;
  String get journalPhoto => _journalPhoto ?? '';
  bool hasJournalPhoto() => _journalPhoto != null;

  // "JournalVoiceNote" field.
  String? _journalVoiceNote;
  String get journalVoiceNote => _journalVoiceNote ?? '';
  bool hasJournalVoiceNote() => _journalVoiceNote != null;

  // "LucilleJournalPrompt" field.
  String? _lucilleJournalPrompt;
  String get lucilleJournalPrompt => _lucilleJournalPrompt ?? '';
  bool hasLucilleJournalPrompt() => _lucilleJournalPrompt != null;

  // "JournalTags" field.
  List<String>? _journalTags;
  List<String> get journalTags => _journalTags ?? const [];
  bool hasJournalTags() => _journalTags != null;

  // "VoiceNoteContent" field.
  String? _voiceNoteContent;
  String get voiceNoteContent => _voiceNoteContent ?? '';
  bool hasVoiceNoteContent() => _voiceNoteContent != null;

  // "isAudioRecording" field.
  bool? _isAudioRecording;
  bool get isAudioRecording => _isAudioRecording ?? false;
  bool hasIsAudioRecording() => _isAudioRecording != null;

  // "isAudioStopped" field.
  bool? _isAudioStopped;
  bool get isAudioStopped => _isAudioStopped ?? false;
  bool hasIsAudioStopped() => _isAudioStopped != null;

  // "TranscribeText" field.
  List<String>? _transcribeText;
  List<String> get transcribeText => _transcribeText ?? const [];
  bool hasTranscribeText() => _transcribeText != null;

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
    _displayName = snapshotData['DisplayName'] as DocumentReference?;
    _journalTitle = snapshotData['JournalTitle'] as String?;
    _journalContent = snapshotData['JournalContent'] as String?;
    _journalPhoto = snapshotData['JournalPhoto'] as String?;
    _journalVoiceNote = snapshotData['JournalVoiceNote'] as String?;
    _lucilleJournalPrompt = snapshotData['LucilleJournalPrompt'] as String?;
    _journalTags = getDataList(snapshotData['JournalTags']);
    _voiceNoteContent = snapshotData['VoiceNoteContent'] as String?;
    _isAudioRecording = snapshotData['isAudioRecording'] as bool?;
    _isAudioStopped = snapshotData['isAudioStopped'] as bool?;
    _transcribeText = getDataList(snapshotData['TranscribeText']);
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
  DocumentReference? displayName,
  String? journalTitle,
  String? journalContent,
  String? journalPhoto,
  String? journalVoiceNote,
  String? lucilleJournalPrompt,
  String? voiceNoteContent,
  bool? isAudioRecording,
  bool? isAudioStopped,
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
      'DisplayName': displayName,
      'JournalTitle': journalTitle,
      'JournalContent': journalContent,
      'JournalPhoto': journalPhoto,
      'JournalVoiceNote': journalVoiceNote,
      'LucilleJournalPrompt': lucilleJournalPrompt,
      'VoiceNoteContent': voiceNoteContent,
      'isAudioRecording': isAudioRecording,
      'isAudioStopped': isAudioStopped,
    }.withoutNulls,
  );

  return firestoreData;
}

class JournalRecordDocumentEquality implements Equality<JournalRecord> {
  const JournalRecordDocumentEquality();

  @override
  bool equals(JournalRecord? e1, JournalRecord? e2) {
    const listEquality = ListEquality();
    return e1?.improvingThoughts == e2?.improvingThoughts &&
        e1?.moods == e2?.moods &&
        e1?.moodPhoto == e2?.moodPhoto &&
        e1?.isMeditationComplete == e2?.isMeditationComplete &&
        e1?.isYogaComplete == e2?.isYogaComplete &&
        e1?.numberOfMeditationsCompleted == e2?.numberOfMeditationsCompleted &&
        e1?.numberOfMentalCompleted == e2?.numberOfMentalCompleted &&
        e1?.numberOfBodyCompleted == e2?.numberOfBodyCompleted &&
        e1?.thoughtsOfGratitude == e2?.thoughtsOfGratitude &&
        e1?.displayName == e2?.displayName &&
        e1?.journalTitle == e2?.journalTitle &&
        e1?.journalContent == e2?.journalContent &&
        e1?.journalPhoto == e2?.journalPhoto &&
        e1?.journalVoiceNote == e2?.journalVoiceNote &&
        e1?.lucilleJournalPrompt == e2?.lucilleJournalPrompt &&
        listEquality.equals(e1?.journalTags, e2?.journalTags) &&
        e1?.voiceNoteContent == e2?.voiceNoteContent &&
        e1?.isAudioRecording == e2?.isAudioRecording &&
        e1?.isAudioStopped == e2?.isAudioStopped &&
        listEquality.equals(e1?.transcribeText, e2?.transcribeText);
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
        e?.thoughtsOfGratitude,
        e?.displayName,
        e?.journalTitle,
        e?.journalContent,
        e?.journalPhoto,
        e?.journalVoiceNote,
        e?.lucilleJournalPrompt,
        e?.journalTags,
        e?.voiceNoteContent,
        e?.isAudioRecording,
        e?.isAudioStopped,
        e?.transcribeText
      ]);

  @override
  bool isValidKey(Object? o) => o is JournalRecord;
}
