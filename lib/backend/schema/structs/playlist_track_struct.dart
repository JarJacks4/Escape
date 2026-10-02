// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlaylistTrackStruct extends FFFirebaseStruct {
  PlaylistTrackStruct({
    String? mediaUrl,
    String? mediaTitle,
    String? mediaArtist,
    String? mediaBanner,
    String? genre,
    String? mood,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mediaUrl = mediaUrl,
        _mediaTitle = mediaTitle,
        _mediaArtist = mediaArtist,
        _mediaBanner = mediaBanner,
        _genre = genre,
        _mood = mood,
        super(firestoreUtilData);

  // "mediaUrl" field.
  String? _mediaUrl;
  String get mediaUrl => _mediaUrl ?? '';
  set mediaUrl(String? val) => _mediaUrl = val;

  bool hasMediaUrl() => _mediaUrl != null;

  // "mediaTitle" field.
  String? _mediaTitle;
  String get mediaTitle => _mediaTitle ?? '';
  set mediaTitle(String? val) => _mediaTitle = val;

  bool hasMediaTitle() => _mediaTitle != null;

  // "mediaArtist" field.
  String? _mediaArtist;
  String get mediaArtist => _mediaArtist ?? '';
  set mediaArtist(String? val) => _mediaArtist = val;

  bool hasMediaArtist() => _mediaArtist != null;

  // "mediaBanner" field.
  String? _mediaBanner;
  String get mediaBanner => _mediaBanner ?? '';
  set mediaBanner(String? val) => _mediaBanner = val;

  bool hasMediaBanner() => _mediaBanner != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  set genre(String? val) => _genre = val;

  bool hasGenre() => _genre != null;

  // "mood" field.
  String? _mood;
  String get mood => _mood ?? '';
  set mood(String? val) => _mood = val;

  bool hasMood() => _mood != null;

  static PlaylistTrackStruct fromMap(Map<String, dynamic> data) =>
      PlaylistTrackStruct(
        mediaUrl: data['mediaUrl'] as String?,
        mediaTitle: data['mediaTitle'] as String?,
        mediaArtist: data['mediaArtist'] as String?,
        mediaBanner: data['mediaBanner'] as String?,
        genre: data['genre'] as String?,
        mood: data['mood'] as String?,
      );

  static PlaylistTrackStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaylistTrackStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mediaUrl': _mediaUrl,
        'mediaTitle': _mediaTitle,
        'mediaArtist': _mediaArtist,
        'mediaBanner': _mediaBanner,
        'genre': _genre,
        'mood': _mood,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mediaUrl': serializeParam(
          _mediaUrl,
          ParamType.String,
        ),
        'mediaTitle': serializeParam(
          _mediaTitle,
          ParamType.String,
        ),
        'mediaArtist': serializeParam(
          _mediaArtist,
          ParamType.String,
        ),
        'mediaBanner': serializeParam(
          _mediaBanner,
          ParamType.String,
        ),
        'genre': serializeParam(
          _genre,
          ParamType.String,
        ),
        'mood': serializeParam(
          _mood,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlaylistTrackStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaylistTrackStruct(
        mediaUrl: deserializeParam(
          data['mediaUrl'],
          ParamType.String,
          false,
        ),
        mediaTitle: deserializeParam(
          data['mediaTitle'],
          ParamType.String,
          false,
        ),
        mediaArtist: deserializeParam(
          data['mediaArtist'],
          ParamType.String,
          false,
        ),
        mediaBanner: deserializeParam(
          data['mediaBanner'],
          ParamType.String,
          false,
        ),
        genre: deserializeParam(
          data['genre'],
          ParamType.String,
          false,
        ),
        mood: deserializeParam(
          data['mood'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlaylistTrackStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaylistTrackStruct &&
        mediaUrl == other.mediaUrl &&
        mediaTitle == other.mediaTitle &&
        mediaArtist == other.mediaArtist &&
        mediaBanner == other.mediaBanner &&
        genre == other.genre &&
        mood == other.mood;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([mediaUrl, mediaTitle, mediaArtist, mediaBanner, genre, mood]);
}

PlaylistTrackStruct createPlaylistTrackStruct({
  String? mediaUrl,
  String? mediaTitle,
  String? mediaArtist,
  String? mediaBanner,
  String? genre,
  String? mood,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaylistTrackStruct(
      mediaUrl: mediaUrl,
      mediaTitle: mediaTitle,
      mediaArtist: mediaArtist,
      mediaBanner: mediaBanner,
      genre: genre,
      mood: mood,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaylistTrackStruct? updatePlaylistTrackStruct(
  PlaylistTrackStruct? playlistTrack, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    playlistTrack
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaylistTrackStructData(
  Map<String, dynamic> firestoreData,
  PlaylistTrackStruct? playlistTrack,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (playlistTrack == null) {
    return;
  }
  if (playlistTrack.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && playlistTrack.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final playlistTrackData =
      getPlaylistTrackFirestoreData(playlistTrack, forFieldValue);
  final nestedData =
      playlistTrackData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = playlistTrack.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaylistTrackFirestoreData(
  PlaylistTrackStruct? playlistTrack, [
  bool forFieldValue = false,
]) {
  if (playlistTrack == null) {
    return {};
  }
  final firestoreData = mapToFirestore(playlistTrack.toMap());

  // Add any Firestore field values
  mapToFirestore(playlistTrack.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaylistTrackListFirestoreData(
  List<PlaylistTrackStruct>? playlistTracks,
) =>
    playlistTracks
        ?.map((e) => getPlaylistTrackFirestoreData(e, true))
        .toList() ??
    [];
