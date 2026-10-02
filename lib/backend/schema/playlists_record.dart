import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaylistsRecord extends FirestoreRecord {
  PlaylistsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isPublic" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "playlistId" field.
  DocumentReference? _playlistId;
  DocumentReference? get playlistId => _playlistId;
  bool hasPlaylistId() => _playlistId != null;

  // "playlistName" field.
  String? _playlistName;
  String get playlistName => _playlistName ?? '';
  bool hasPlaylistName() => _playlistName != null;

  // "playlistDescription" field.
  String? _playlistDescription;
  String get playlistDescription => _playlistDescription ?? '';
  bool hasPlaylistDescription() => _playlistDescription != null;

  // "tracks" field.
  List<String>? _tracks;
  List<String> get tracks => _tracks ?? const [];
  bool hasTracks() => _tracks != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "ikes" field.
  int? _ikes;
  int get ikes => _ikes ?? 0;
  bool hasIkes() => _ikes != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "trackItems" field.
  List<PlaylistTrackStruct>? _trackItems;
  List<PlaylistTrackStruct> get trackItems => _trackItems ?? const [];
  bool hasTrackItems() => _trackItems != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isPublic = snapshotData['isPublic'] as bool?;
    _playlistId = snapshotData['playlistId'] as DocumentReference?;
    _playlistName = snapshotData['playlistName'] as String?;
    _playlistDescription = snapshotData['playlistDescription'] as String?;
    _tracks = getDataList(snapshotData['tracks']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _tags = getDataList(snapshotData['tags']);
    _ikes = castToType<int>(snapshotData['ikes']);
    _comments = snapshotData['comments'] as String?;
    _trackItems = getStructList(
      snapshotData['trackItems'],
      PlaylistTrackStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Playlists')
          : FirebaseFirestore.instance.collectionGroup('Playlists');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Playlists').doc(id);

  static Stream<PlaylistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaylistsRecord.fromSnapshot(s));

  static Future<PlaylistsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaylistsRecord.fromSnapshot(s));

  static PlaylistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaylistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaylistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaylistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaylistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaylistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaylistsRecordData({
  bool? isPublic,
  DocumentReference? playlistId,
  String? playlistName,
  String? playlistDescription,
  DateTime? createdAt,
  int? ikes,
  String? comments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isPublic': isPublic,
      'playlistId': playlistId,
      'playlistName': playlistName,
      'playlistDescription': playlistDescription,
      'createdAt': createdAt,
      'ikes': ikes,
      'comments': comments,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaylistsRecordDocumentEquality implements Equality<PlaylistsRecord> {
  const PlaylistsRecordDocumentEquality();

  @override
  bool equals(PlaylistsRecord? e1, PlaylistsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.isPublic == e2?.isPublic &&
        e1?.playlistId == e2?.playlistId &&
        e1?.playlistName == e2?.playlistName &&
        e1?.playlistDescription == e2?.playlistDescription &&
        listEquality.equals(e1?.tracks, e2?.tracks) &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.ikes == e2?.ikes &&
        e1?.comments == e2?.comments &&
        listEquality.equals(e1?.trackItems, e2?.trackItems);
  }

  @override
  int hash(PlaylistsRecord? e) => const ListEquality().hash([
        e?.isPublic,
        e?.playlistId,
        e?.playlistName,
        e?.playlistDescription,
        e?.tracks,
        e?.createdAt,
        e?.tags,
        e?.ikes,
        e?.comments,
        e?.trackItems
      ]);

  @override
  bool isValidKey(Object? o) => o is PlaylistsRecord;
}
