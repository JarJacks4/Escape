// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaylistStruct extends FFFirebaseStruct {
  PlaylistStruct({
    String? id,
    String? title,
    String? coverUrl,
    List<TracksStruct>? tracks,
    String? genre,
    String? mood,
    String? artist,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _coverUrl = coverUrl,
        _tracks = tracks,
        _genre = genre,
        _mood = mood,
        _artist = artist,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "cover_url" field.
  String? _coverUrl;
  String get coverUrl => _coverUrl ?? '';
  set coverUrl(String? val) => _coverUrl = val;

  bool hasCoverUrl() => _coverUrl != null;

  // "tracks" field.
  List<TracksStruct>? _tracks;
  List<TracksStruct> get tracks => _tracks ?? const [];
  set tracks(List<TracksStruct>? val) => _tracks = val;

  void updateTracks(Function(List<TracksStruct>) updateFn) {
    updateFn(_tracks ??= []);
  }

  bool hasTracks() => _tracks != null;

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

  // "artist" field.
  String? _artist;
  String get artist => _artist ?? '';
  set artist(String? val) => _artist = val;

  bool hasArtist() => _artist != null;

  static PlaylistStruct fromMap(Map<String, dynamic> data) => PlaylistStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        coverUrl: data['cover_url'] as String?,
        tracks: getStructList(
          data['tracks'],
          TracksStruct.fromMap,
        ),
        genre: data['genre'] as String?,
        mood: data['mood'] as String?,
        artist: data['artist'] as String?,
      );

  static PlaylistStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlaylistStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'cover_url': _coverUrl,
        'tracks': _tracks?.map((e) => e.toMap()).toList(),
        'genre': _genre,
        'mood': _mood,
        'artist': _artist,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'cover_url': serializeParam(
          _coverUrl,
          ParamType.String,
        ),
        'tracks': serializeParam(
          _tracks,
          ParamType.DataStruct,
          isList: true,
        ),
        'genre': serializeParam(
          _genre,
          ParamType.String,
        ),
        'mood': serializeParam(
          _mood,
          ParamType.String,
        ),
        'artist': serializeParam(
          _artist,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlaylistStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaylistStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        coverUrl: deserializeParam(
          data['cover_url'],
          ParamType.String,
          false,
        ),
        tracks: deserializeStructParam<TracksStruct>(
          data['tracks'],
          ParamType.DataStruct,
          true,
          structBuilder: TracksStruct.fromSerializableMap,
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
        artist: deserializeParam(
          data['artist'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlaylistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlaylistStruct &&
        id == other.id &&
        title == other.title &&
        coverUrl == other.coverUrl &&
        listEquality.equals(tracks, other.tracks) &&
        genre == other.genre &&
        mood == other.mood &&
        artist == other.artist;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, title, coverUrl, tracks, genre, mood, artist]);
}

PlaylistStruct createPlaylistStruct({
  String? id,
  String? title,
  String? coverUrl,
  String? genre,
  String? mood,
  String? artist,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlaylistStruct(
      id: id,
      title: title,
      coverUrl: coverUrl,
      genre: genre,
      mood: mood,
      artist: artist,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlaylistStruct? updatePlaylistStruct(
  PlaylistStruct? playlist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    playlist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlaylistStructData(
  Map<String, dynamic> firestoreData,
  PlaylistStruct? playlist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (playlist == null) {
    return;
  }
  if (playlist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && playlist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final playlistData = getPlaylistFirestoreData(playlist, forFieldValue);
  final nestedData = playlistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = playlist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlaylistFirestoreData(
  PlaylistStruct? playlist, [
  bool forFieldValue = false,
]) {
  if (playlist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(playlist.toMap());

  // Add any Firestore field values
  mapToFirestore(playlist.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlaylistListFirestoreData(
  List<PlaylistStruct>? playlists,
) =>
    playlists?.map((e) => getPlaylistFirestoreData(e, true)).toList() ?? [];
