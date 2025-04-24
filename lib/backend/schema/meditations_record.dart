import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeditationsRecord extends FirestoreRecord {
  MeditationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "providerID" field.
  DocumentReference? _providerID;
  DocumentReference? get providerID => _providerID;
  bool hasProviderID() => _providerID != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "SessionID" field.
  String? _sessionID;
  String get sessionID => _sessionID ?? '';
  bool hasSessionID() => _sessionID != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "audioURL" field.
  String? _audioURL;
  String get audioURL => _audioURL ?? '';
  bool hasAudioURL() => _audioURL != null;

  // "ProfilePicture" field.
  DocumentReference? _profilePicture;
  DocumentReference? get profilePicture => _profilePicture;
  bool hasProfilePicture() => _profilePicture != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _providerID = snapshotData['providerID'] as DocumentReference?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _completed = snapshotData['completed'] as bool?;
    _sessionID = snapshotData['SessionID'] as String?;
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _duration = castToType<int>(snapshotData['Duration']);
    _audioURL = snapshotData['audioURL'] as String?;
    _profilePicture = snapshotData['ProfilePicture'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Meditations')
          : FirebaseFirestore.instance.collectionGroup('Meditations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Meditations').doc(id);

  static Stream<MeditationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeditationsRecord.fromSnapshot(s));

  static Future<MeditationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeditationsRecord.fromSnapshot(s));

  static MeditationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeditationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeditationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeditationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeditationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeditationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeditationsRecordData({
  DateTime? date,
  DocumentReference? providerID,
  DocumentReference? userID,
  bool? completed,
  String? sessionID,
  String? title,
  String? description,
  int? duration,
  String? audioURL,
  DocumentReference? profilePicture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'providerID': providerID,
      'userID': userID,
      'completed': completed,
      'SessionID': sessionID,
      'Title': title,
      'Description': description,
      'Duration': duration,
      'audioURL': audioURL,
      'ProfilePicture': profilePicture,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeditationsRecordDocumentEquality implements Equality<MeditationsRecord> {
  const MeditationsRecordDocumentEquality();

  @override
  bool equals(MeditationsRecord? e1, MeditationsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.providerID == e2?.providerID &&
        e1?.userID == e2?.userID &&
        e1?.completed == e2?.completed &&
        e1?.sessionID == e2?.sessionID &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.duration == e2?.duration &&
        e1?.audioURL == e2?.audioURL &&
        e1?.profilePicture == e2?.profilePicture;
  }

  @override
  int hash(MeditationsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.providerID,
        e?.userID,
        e?.completed,
        e?.sessionID,
        e?.title,
        e?.description,
        e?.duration,
        e?.audioURL,
        e?.profilePicture
      ]);

  @override
  bool isValidKey(Object? o) => o is MeditationsRecord;
}
