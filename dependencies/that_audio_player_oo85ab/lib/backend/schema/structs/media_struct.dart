// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediaStruct extends FFFirebaseStruct {
  MediaStruct({
    String? mediaUrl,
    String? mediaArtist,
    String? mediaTitle,
    String? mediaBanner,
    String? genre,
    String? mood,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mediaUrl = mediaUrl,
        _mediaArtist = mediaArtist,
        _mediaTitle = mediaTitle,
        _mediaBanner = mediaBanner,
        _genre = genre,
        _mood = mood,
        super(firestoreUtilData);

  // "mediaUrl" field.
  String? _mediaUrl;
  String get mediaUrl => _mediaUrl ?? '';
  set mediaUrl(String? val) => _mediaUrl = val;

  bool hasMediaUrl() => _mediaUrl != null;

  // "mediaArtist" field.
  String? _mediaArtist;
  String get mediaArtist => _mediaArtist ?? '';
  set mediaArtist(String? val) => _mediaArtist = val;

  bool hasMediaArtist() => _mediaArtist != null;

  // "mediaTitle" field.
  String? _mediaTitle;
  String get mediaTitle => _mediaTitle ?? '';
  set mediaTitle(String? val) => _mediaTitle = val;

  bool hasMediaTitle() => _mediaTitle != null;

  // "mediaBanner" field.
  String? _mediaBanner;
  String get mediaBanner => _mediaBanner ?? '';
  set mediaBanner(String? val) => _mediaBanner = val;

  bool hasMediaBanner() => _mediaBanner != null;

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

  static MediaStruct fromMap(Map<String, dynamic> data) => MediaStruct(
        mediaUrl: data['mediaUrl'] as String?,
        mediaArtist: data['mediaArtist'] as String?,
        mediaTitle: data['mediaTitle'] as String?,
        mediaBanner: data['mediaBanner'] as String?,
        genre: data['Genre'] as String?,
        mood: data['Mood'] as String?,
      );

  static MediaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MediaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'mediaUrl': _mediaUrl,
        'mediaArtist': _mediaArtist,
        'mediaTitle': _mediaTitle,
        'mediaBanner': _mediaBanner,
        'Genre': _genre,
        'Mood': _mood,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mediaUrl': serializeParam(
          _mediaUrl,
          ParamType.String,
        ),
        'mediaArtist': serializeParam(
          _mediaArtist,
          ParamType.String,
        ),
        'mediaTitle': serializeParam(
          _mediaTitle,
          ParamType.String,
        ),
        'mediaBanner': serializeParam(
          _mediaBanner,
          ParamType.String,
        ),
        'Genre': serializeParam(
          _genre,
          ParamType.String,
        ),
        'Mood': serializeParam(
          _mood,
          ParamType.String,
        ),
      }.withoutNulls;

  static MediaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediaStruct(
        mediaUrl: deserializeParam(
          data['mediaUrl'],
          ParamType.String,
          false,
        ),
        mediaArtist: deserializeParam(
          data['mediaArtist'],
          ParamType.String,
          false,
        ),
        mediaTitle: deserializeParam(
          data['mediaTitle'],
          ParamType.String,
          false,
        ),
        mediaBanner: deserializeParam(
          data['mediaBanner'],
          ParamType.String,
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
      );

  @override
  String toString() => 'MediaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediaStruct &&
        mediaUrl == other.mediaUrl &&
        mediaArtist == other.mediaArtist &&
        mediaTitle == other.mediaTitle &&
        mediaBanner == other.mediaBanner &&
        genre == other.genre &&
        mood == other.mood;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([mediaUrl, mediaArtist, mediaTitle, mediaBanner, genre, mood]);
}

MediaStruct createMediaStruct({
  String? mediaUrl,
  String? mediaArtist,
  String? mediaTitle,
  String? mediaBanner,
  String? genre,
  String? mood,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MediaStruct(
      mediaUrl: mediaUrl,
      mediaArtist: mediaArtist,
      mediaTitle: mediaTitle,
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

MediaStruct? updateMediaStruct(
  MediaStruct? media, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    media
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMediaStructData(
  Map<String, dynamic> firestoreData,
  MediaStruct? media,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (media == null) {
    return;
  }
  if (media.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && media.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mediaData = getMediaFirestoreData(media, forFieldValue);
  final nestedData = mediaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = media.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMediaFirestoreData(
  MediaStruct? media, [
  bool forFieldValue = false,
]) {
  if (media == null) {
    return {};
  }
  final firestoreData = mapToFirestore(media.toMap());

  // Add any Firestore field values
  media.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMediaListFirestoreData(
  List<MediaStruct>? medias,
) =>
    medias?.map((e) => getMediaFirestoreData(e, true)).toList() ?? [];
