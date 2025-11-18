// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TracksStruct extends FFFirebaseStruct {
  TracksStruct({
    String? id,
    String? title,
    String? previewUrl,
    String? genre,
    String? mood,
    int? duration,
    String? coverUrl,
    String? coverartUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _previewUrl = previewUrl,
        _genre = genre,
        _mood = mood,
        _duration = duration,
        _coverUrl = coverUrl,
        _coverartUrl = coverartUrl,
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

  // "preview_url" field.
  String? _previewUrl;
  String get previewUrl => _previewUrl ?? '';
  set previewUrl(String? val) => _previewUrl = val;

  bool hasPreviewUrl() => _previewUrl != null;

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

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;

  void incrementDuration(int amount) => duration = duration + amount;

  bool hasDuration() => _duration != null;

  // "cover_url" field.
  String? _coverUrl;
  String get coverUrl => _coverUrl ?? '';
  set coverUrl(String? val) => _coverUrl = val;

  bool hasCoverUrl() => _coverUrl != null;

  // "coverart_url" field.
  String? _coverartUrl;
  String get coverartUrl => _coverartUrl ?? '';
  set coverartUrl(String? val) => _coverartUrl = val;

  bool hasCoverartUrl() => _coverartUrl != null;

  static TracksStruct fromMap(Map<String, dynamic> data) => TracksStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        previewUrl: data['preview_url'] as String?,
        genre: data['genre'] as String?,
        mood: data['mood'] as String?,
        duration: castToType<int>(data['duration']),
        coverUrl: data['cover_url'] as String?,
        coverartUrl: data['coverart_url'] as String?,
      );

  static TracksStruct? maybeFromMap(dynamic data) =>
      data is Map ? TracksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'preview_url': _previewUrl,
        'genre': _genre,
        'mood': _mood,
        'duration': _duration,
        'cover_url': _coverUrl,
        'coverart_url': _coverartUrl,
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
        'preview_url': serializeParam(
          _previewUrl,
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
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'cover_url': serializeParam(
          _coverUrl,
          ParamType.String,
        ),
        'coverart_url': serializeParam(
          _coverartUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static TracksStruct fromSerializableMap(Map<String, dynamic> data) =>
      TracksStruct(
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
        previewUrl: deserializeParam(
          data['preview_url'],
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
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        coverUrl: deserializeParam(
          data['cover_url'],
          ParamType.String,
          false,
        ),
        coverartUrl: deserializeParam(
          data['coverart_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TracksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TracksStruct &&
        id == other.id &&
        title == other.title &&
        previewUrl == other.previewUrl &&
        genre == other.genre &&
        mood == other.mood &&
        duration == other.duration &&
        coverUrl == other.coverUrl &&
        coverartUrl == other.coverartUrl;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, title, previewUrl, genre, mood, duration, coverUrl, coverartUrl]);
}

TracksStruct createTracksStruct({
  String? id,
  String? title,
  String? previewUrl,
  String? genre,
  String? mood,
  int? duration,
  String? coverUrl,
  String? coverartUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TracksStruct(
      id: id,
      title: title,
      previewUrl: previewUrl,
      genre: genre,
      mood: mood,
      duration: duration,
      coverUrl: coverUrl,
      coverartUrl: coverartUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TracksStruct? updateTracksStruct(
  TracksStruct? tracks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tracks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTracksStructData(
  Map<String, dynamic> firestoreData,
  TracksStruct? tracks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tracks == null) {
    return;
  }
  if (tracks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tracks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tracksData = getTracksFirestoreData(tracks, forFieldValue);
  final nestedData = tracksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tracks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTracksFirestoreData(
  TracksStruct? tracks, [
  bool forFieldValue = false,
]) {
  if (tracks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tracks.toMap());

  // Add any Firestore field values
  tracks.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTracksListFirestoreData(
  List<TracksStruct>? trackss,
) =>
    trackss?.map((e) => getTracksFirestoreData(e, true)).toList() ?? [];
