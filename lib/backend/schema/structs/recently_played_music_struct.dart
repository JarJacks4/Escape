// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RecentlyPlayedMusicStruct extends FFFirebaseStruct {
  RecentlyPlayedMusicStruct({
    String? url,
    String? albumArt,
    String? genre,
    String? mood,
    String? title,
    String? audioURL,
    String? artist,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _url = url,
        _albumArt = albumArt,
        _genre = genre,
        _mood = mood,
        _title = title,
        _audioURL = audioURL,
        _artist = artist,
        super(firestoreUtilData);

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "albumArt" field.
  String? _albumArt;
  String get albumArt => _albumArt ?? '';
  set albumArt(String? val) => _albumArt = val;

  bool hasAlbumArt() => _albumArt != null;

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

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "audioURL" field.
  String? _audioURL;
  String get audioURL => _audioURL ?? '';
  set audioURL(String? val) => _audioURL = val;

  bool hasAudioURL() => _audioURL != null;

  // "artist" field.
  String? _artist;
  String get artist => _artist ?? '';
  set artist(String? val) => _artist = val;

  bool hasArtist() => _artist != null;

  static RecentlyPlayedMusicStruct fromMap(Map<String, dynamic> data) =>
      RecentlyPlayedMusicStruct(
        url: data['url'] as String?,
        albumArt: data['albumArt'] as String?,
        genre: data['genre'] as String?,
        mood: data['mood'] as String?,
        title: data['title'] as String?,
        audioURL: data['audioURL'] as String?,
        artist: data['artist'] as String?,
      );

  static RecentlyPlayedMusicStruct? maybeFromMap(dynamic data) => data is Map
      ? RecentlyPlayedMusicStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'albumArt': _albumArt,
        'genre': _genre,
        'mood': _mood,
        'title': _title,
        'audioURL': _audioURL,
        'artist': _artist,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'albumArt': serializeParam(
          _albumArt,
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
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'audioURL': serializeParam(
          _audioURL,
          ParamType.String,
        ),
        'artist': serializeParam(
          _artist,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecentlyPlayedMusicStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RecentlyPlayedMusicStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        albumArt: deserializeParam(
          data['albumArt'],
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
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        audioURL: deserializeParam(
          data['audioURL'],
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
  String toString() => 'RecentlyPlayedMusicStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecentlyPlayedMusicStruct &&
        url == other.url &&
        albumArt == other.albumArt &&
        genre == other.genre &&
        mood == other.mood &&
        title == other.title &&
        audioURL == other.audioURL &&
        artist == other.artist;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([url, albumArt, genre, mood, title, audioURL, artist]);
}

RecentlyPlayedMusicStruct createRecentlyPlayedMusicStruct({
  String? url,
  String? albumArt,
  String? genre,
  String? mood,
  String? title,
  String? audioURL,
  String? artist,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecentlyPlayedMusicStruct(
      url: url,
      albumArt: albumArt,
      genre: genre,
      mood: mood,
      title: title,
      audioURL: audioURL,
      artist: artist,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecentlyPlayedMusicStruct? updateRecentlyPlayedMusicStruct(
  RecentlyPlayedMusicStruct? recentlyPlayedMusic, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recentlyPlayedMusic
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecentlyPlayedMusicStructData(
  Map<String, dynamic> firestoreData,
  RecentlyPlayedMusicStruct? recentlyPlayedMusic,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recentlyPlayedMusic == null) {
    return;
  }
  if (recentlyPlayedMusic.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recentlyPlayedMusic.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recentlyPlayedMusicData =
      getRecentlyPlayedMusicFirestoreData(recentlyPlayedMusic, forFieldValue);
  final nestedData =
      recentlyPlayedMusicData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      recentlyPlayedMusic.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecentlyPlayedMusicFirestoreData(
  RecentlyPlayedMusicStruct? recentlyPlayedMusic, [
  bool forFieldValue = false,
]) {
  if (recentlyPlayedMusic == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recentlyPlayedMusic.toMap());

  // Add any Firestore field values
  mapToFirestore(recentlyPlayedMusic.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecentlyPlayedMusicListFirestoreData(
  List<RecentlyPlayedMusicStruct>? recentlyPlayedMusics,
) =>
    recentlyPlayedMusics
        ?.map((e) => getRecentlyPlayedMusicFirestoreData(e, true))
        .toList() ??
    [];
