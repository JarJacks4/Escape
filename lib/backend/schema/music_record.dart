import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusicRecord extends FirestoreRecord {
  MusicRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "music_name" field.
  String? _musicName;
  String get musicName => _musicName ?? '';
  bool hasMusicName() => _musicName != null;

  // "artist_name" field.
  String? _artistName;
  String get artistName => _artistName ?? '';
  bool hasArtistName() => _artistName != null;

  // "album_name" field.
  String? _albumName;
  String get albumName => _albumName ?? '';
  bool hasAlbumName() => _albumName != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  bool hasYear() => _year != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "releaseDate" field.
  DateTime? _releaseDate;
  DateTime? get releaseDate => _releaseDate;
  bool hasReleaseDate() => _releaseDate != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "playCount" field.
  int? _playCount;
  int get playCount => _playCount ?? 0;
  bool hasPlayCount() => _playCount != null;

  // "mp3File" field.
  String? _mp3File;
  String get mp3File => _mp3File ?? '';
  bool hasMp3File() => _mp3File != null;

  void _initializeFields() {
    _musicName = snapshotData['music_name'] as String?;
    _artistName = snapshotData['artist_name'] as String?;
    _albumName = snapshotData['album_name'] as String?;
    _genre = snapshotData['genre'] as String?;
    _year = castToType<int>(snapshotData['year']);
    _image = snapshotData['image'] as String?;
    _releaseDate = snapshotData['releaseDate'] as DateTime?;
    _duration = castToType<int>(snapshotData['duration']);
    _likes = castToType<int>(snapshotData['likes']);
    _playCount = castToType<int>(snapshotData['playCount']);
    _mp3File = snapshotData['mp3File'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Music');

  static Stream<MusicRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MusicRecord.fromSnapshot(s));

  static Future<MusicRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MusicRecord.fromSnapshot(s));

  static MusicRecord fromSnapshot(DocumentSnapshot snapshot) => MusicRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MusicRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MusicRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MusicRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MusicRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMusicRecordData({
  String? musicName,
  String? artistName,
  String? albumName,
  String? genre,
  int? year,
  String? image,
  DateTime? releaseDate,
  int? duration,
  int? likes,
  int? playCount,
  String? mp3File,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'music_name': musicName,
      'artist_name': artistName,
      'album_name': albumName,
      'genre': genre,
      'year': year,
      'image': image,
      'releaseDate': releaseDate,
      'duration': duration,
      'likes': likes,
      'playCount': playCount,
      'mp3File': mp3File,
    }.withoutNulls,
  );

  return firestoreData;
}

class MusicRecordDocumentEquality implements Equality<MusicRecord> {
  const MusicRecordDocumentEquality();

  @override
  bool equals(MusicRecord? e1, MusicRecord? e2) {
    return e1?.musicName == e2?.musicName &&
        e1?.artistName == e2?.artistName &&
        e1?.albumName == e2?.albumName &&
        e1?.genre == e2?.genre &&
        e1?.year == e2?.year &&
        e1?.image == e2?.image &&
        e1?.releaseDate == e2?.releaseDate &&
        e1?.duration == e2?.duration &&
        e1?.likes == e2?.likes &&
        e1?.playCount == e2?.playCount &&
        e1?.mp3File == e2?.mp3File;
  }

  @override
  int hash(MusicRecord? e) => const ListEquality().hash([
        e?.musicName,
        e?.artistName,
        e?.albumName,
        e?.genre,
        e?.year,
        e?.image,
        e?.releaseDate,
        e?.duration,
        e?.likes,
        e?.playCount,
        e?.mp3File
      ]);

  @override
  bool isValidKey(Object? o) => o is MusicRecord;
}
