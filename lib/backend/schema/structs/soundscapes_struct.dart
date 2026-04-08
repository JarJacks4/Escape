// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SoundscapesStruct extends FFFirebaseStruct {
  SoundscapesStruct({
    String? artist,
    String? songTitle,
    String? albumArt,
    double? duration,
    String? genre,
    String? mood,
    String? songUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _artist = artist,
        _songTitle = songTitle,
        _albumArt = albumArt,
        _duration = duration,
        _genre = genre,
        _mood = mood,
        _songUrl = songUrl,
        super(firestoreUtilData);

  // "Artist" field.
  String? _artist;
  String get artist => _artist ?? '';
  set artist(String? val) => _artist = val;

  bool hasArtist() => _artist != null;

  // "SongTitle" field.
  String? _songTitle;
  String get songTitle => _songTitle ?? '';
  set songTitle(String? val) => _songTitle = val;

  bool hasSongTitle() => _songTitle != null;

  // "AlbumArt" field.
  String? _albumArt;
  String get albumArt => _albumArt ?? '';
  set albumArt(String? val) => _albumArt = val;

  bool hasAlbumArt() => _albumArt != null;

  // "Duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  set duration(double? val) => _duration = val;

  void incrementDuration(double amount) => duration = duration + amount;

  bool hasDuration() => _duration != null;

  // "Genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  set genre(String? val) => _genre = val;

  bool hasGenre() => _genre != null;

  // "Mood" field.
  String? _mood;
  String get mood => _mood ?? '';
  set mood(String? val) => _mood = val;

  bool hasMood() => _mood != null;

  // "SongUrl" field.
  String? _songUrl;
  String get songUrl => _songUrl ?? '';
  set songUrl(String? val) => _songUrl = val;

  bool hasSongUrl() => _songUrl != null;

  static SoundscapesStruct fromMap(Map<String, dynamic> data) =>
      SoundscapesStruct(
        artist: data['Artist'] as String?,
        songTitle: data['SongTitle'] as String?,
        albumArt: data['AlbumArt'] as String?,
        duration: castToType<double>(data['Duration']),
        genre: data['Genre'] as String?,
        mood: data['Mood'] as String?,
        songUrl: data['SongUrl'] as String?,
      );

  static SoundscapesStruct? maybeFromMap(dynamic data) => data is Map
      ? SoundscapesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Artist': _artist,
        'SongTitle': _songTitle,
        'AlbumArt': _albumArt,
        'Duration': _duration,
        'Genre': _genre,
        'Mood': _mood,
        'SongUrl': _songUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Artist': serializeParam(
          _artist,
          ParamType.String,
        ),
        'SongTitle': serializeParam(
          _songTitle,
          ParamType.String,
        ),
        'AlbumArt': serializeParam(
          _albumArt,
          ParamType.String,
        ),
        'Duration': serializeParam(
          _duration,
          ParamType.double,
        ),
        'Genre': serializeParam(
          _genre,
          ParamType.String,
        ),
        'Mood': serializeParam(
          _mood,
          ParamType.String,
        ),
        'SongUrl': serializeParam(
          _songUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static SoundscapesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SoundscapesStruct(
        artist: deserializeParam(
          data['Artist'],
          ParamType.String,
          false,
        ),
        songTitle: deserializeParam(
          data['SongTitle'],
          ParamType.String,
          false,
        ),
        albumArt: deserializeParam(
          data['AlbumArt'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['Duration'],
          ParamType.double,
          false,
        ),
        genre: deserializeParam(
          data['Genre'],
          ParamType.String,
          false,
        ),
        mood: deserializeParam(
          data['Mood'],
          ParamType.String,
          false,
        ),
        songUrl: deserializeParam(
          data['SongUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SoundscapesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SoundscapesStruct &&
        artist == other.artist &&
        songTitle == other.songTitle &&
        albumArt == other.albumArt &&
        duration == other.duration &&
        genre == other.genre &&
        mood == other.mood &&
        songUrl == other.songUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([artist, songTitle, albumArt, duration, genre, mood, songUrl]);
}

SoundscapesStruct createSoundscapesStruct({
  String? artist,
  String? songTitle,
  String? albumArt,
  double? duration,
  String? genre,
  String? mood,
  String? songUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SoundscapesStruct(
      artist: artist,
      songTitle: songTitle,
      albumArt: albumArt,
      duration: duration,
      genre: genre,
      mood: mood,
      songUrl: songUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SoundscapesStruct? updateSoundscapesStruct(
  SoundscapesStruct? soundscapes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    soundscapes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSoundscapesStructData(
  Map<String, dynamic> firestoreData,
  SoundscapesStruct? soundscapes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (soundscapes == null) {
    return;
  }
  if (soundscapes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && soundscapes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final soundscapesData =
      getSoundscapesFirestoreData(soundscapes, forFieldValue);
  final nestedData =
      soundscapesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = soundscapes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSoundscapesFirestoreData(
  SoundscapesStruct? soundscapes, [
  bool forFieldValue = false,
]) {
  if (soundscapes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(soundscapes.toMap());

  // Add any Firestore field values
  mapToFirestore(soundscapes.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSoundscapesListFirestoreData(
  List<SoundscapesStruct>? soundscapess,
) =>
    soundscapess?.map((e) => getSoundscapesFirestoreData(e, true)).toList() ??
    [];
