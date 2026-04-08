// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SnippetStruct extends FFFirebaseStruct {
  SnippetStruct({
    String? publishedAt,
    String? channelId,
    String? title,
    String? description,
    ThumbnailsAllStruct? thumbnails,
    String? channelTitle,
    String? playlistId,
    int? position,
    ResourceIdStruct? resourceId,
    String? videoOwnerChannelTitle,
    String? videoOwnerChannelId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _publishedAt = publishedAt,
        _channelId = channelId,
        _title = title,
        _description = description,
        _thumbnails = thumbnails,
        _channelTitle = channelTitle,
        _playlistId = playlistId,
        _position = position,
        _resourceId = resourceId,
        _videoOwnerChannelTitle = videoOwnerChannelTitle,
        _videoOwnerChannelId = videoOwnerChannelId,
        super(firestoreUtilData);

  // "publishedAt" field.
  String? _publishedAt;
  String get publishedAt => _publishedAt ?? '';
  set publishedAt(String? val) => _publishedAt = val;

  bool hasPublishedAt() => _publishedAt != null;

  // "channelId" field.
  String? _channelId;
  String get channelId => _channelId ?? '';
  set channelId(String? val) => _channelId = val;

  bool hasChannelId() => _channelId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "thumbnails" field.
  ThumbnailsAllStruct? _thumbnails;
  ThumbnailsAllStruct get thumbnails => _thumbnails ?? ThumbnailsAllStruct();
  set thumbnails(ThumbnailsAllStruct? val) => _thumbnails = val;

  void updateThumbnails(Function(ThumbnailsAllStruct) updateFn) {
    updateFn(_thumbnails ??= ThumbnailsAllStruct());
  }

  bool hasThumbnails() => _thumbnails != null;

  // "channelTitle" field.
  String? _channelTitle;
  String get channelTitle => _channelTitle ?? '';
  set channelTitle(String? val) => _channelTitle = val;

  bool hasChannelTitle() => _channelTitle != null;

  // "playlistId" field.
  String? _playlistId;
  String get playlistId => _playlistId ?? '';
  set playlistId(String? val) => _playlistId = val;

  bool hasPlaylistId() => _playlistId != null;

  // "position" field.
  int? _position;
  int get position => _position ?? 0;
  set position(int? val) => _position = val;

  void incrementPosition(int amount) => position = position + amount;

  bool hasPosition() => _position != null;

  // "resourceId" field.
  ResourceIdStruct? _resourceId;
  ResourceIdStruct get resourceId => _resourceId ?? ResourceIdStruct();
  set resourceId(ResourceIdStruct? val) => _resourceId = val;

  void updateResourceId(Function(ResourceIdStruct) updateFn) {
    updateFn(_resourceId ??= ResourceIdStruct());
  }

  bool hasResourceId() => _resourceId != null;

  // "videoOwnerChannelTitle" field.
  String? _videoOwnerChannelTitle;
  String get videoOwnerChannelTitle => _videoOwnerChannelTitle ?? '';
  set videoOwnerChannelTitle(String? val) => _videoOwnerChannelTitle = val;

  bool hasVideoOwnerChannelTitle() => _videoOwnerChannelTitle != null;

  // "videoOwnerChannelId" field.
  String? _videoOwnerChannelId;
  String get videoOwnerChannelId => _videoOwnerChannelId ?? '';
  set videoOwnerChannelId(String? val) => _videoOwnerChannelId = val;

  bool hasVideoOwnerChannelId() => _videoOwnerChannelId != null;

  static SnippetStruct fromMap(Map<String, dynamic> data) => SnippetStruct(
        publishedAt: data['publishedAt'] as String?,
        channelId: data['channelId'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        thumbnails: data['thumbnails'] is ThumbnailsAllStruct
            ? data['thumbnails']
            : ThumbnailsAllStruct.maybeFromMap(data['thumbnails']),
        channelTitle: data['channelTitle'] as String?,
        playlistId: data['playlistId'] as String?,
        position: castToType<int>(data['position']),
        resourceId: data['resourceId'] is ResourceIdStruct
            ? data['resourceId']
            : ResourceIdStruct.maybeFromMap(data['resourceId']),
        videoOwnerChannelTitle: data['videoOwnerChannelTitle'] as String?,
        videoOwnerChannelId: data['videoOwnerChannelId'] as String?,
      );

  static SnippetStruct? maybeFromMap(dynamic data) =>
      data is Map ? SnippetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'publishedAt': _publishedAt,
        'channelId': _channelId,
        'title': _title,
        'description': _description,
        'thumbnails': _thumbnails?.toMap(),
        'channelTitle': _channelTitle,
        'playlistId': _playlistId,
        'position': _position,
        'resourceId': _resourceId?.toMap(),
        'videoOwnerChannelTitle': _videoOwnerChannelTitle,
        'videoOwnerChannelId': _videoOwnerChannelId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'publishedAt': serializeParam(
          _publishedAt,
          ParamType.String,
        ),
        'channelId': serializeParam(
          _channelId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'thumbnails': serializeParam(
          _thumbnails,
          ParamType.DataStruct,
        ),
        'channelTitle': serializeParam(
          _channelTitle,
          ParamType.String,
        ),
        'playlistId': serializeParam(
          _playlistId,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.int,
        ),
        'resourceId': serializeParam(
          _resourceId,
          ParamType.DataStruct,
        ),
        'videoOwnerChannelTitle': serializeParam(
          _videoOwnerChannelTitle,
          ParamType.String,
        ),
        'videoOwnerChannelId': serializeParam(
          _videoOwnerChannelId,
          ParamType.String,
        ),
      }.withoutNulls;

  static SnippetStruct fromSerializableMap(Map<String, dynamic> data) =>
      SnippetStruct(
        publishedAt: deserializeParam(
          data['publishedAt'],
          ParamType.String,
          false,
        ),
        channelId: deserializeParam(
          data['channelId'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        thumbnails: deserializeStructParam(
          data['thumbnails'],
          ParamType.DataStruct,
          false,
          structBuilder: ThumbnailsAllStruct.fromSerializableMap,
        ),
        channelTitle: deserializeParam(
          data['channelTitle'],
          ParamType.String,
          false,
        ),
        playlistId: deserializeParam(
          data['playlistId'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.int,
          false,
        ),
        resourceId: deserializeStructParam(
          data['resourceId'],
          ParamType.DataStruct,
          false,
          structBuilder: ResourceIdStruct.fromSerializableMap,
        ),
        videoOwnerChannelTitle: deserializeParam(
          data['videoOwnerChannelTitle'],
          ParamType.String,
          false,
        ),
        videoOwnerChannelId: deserializeParam(
          data['videoOwnerChannelId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SnippetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SnippetStruct &&
        publishedAt == other.publishedAt &&
        channelId == other.channelId &&
        title == other.title &&
        description == other.description &&
        thumbnails == other.thumbnails &&
        channelTitle == other.channelTitle &&
        playlistId == other.playlistId &&
        position == other.position &&
        resourceId == other.resourceId &&
        videoOwnerChannelTitle == other.videoOwnerChannelTitle &&
        videoOwnerChannelId == other.videoOwnerChannelId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        publishedAt,
        channelId,
        title,
        description,
        thumbnails,
        channelTitle,
        playlistId,
        position,
        resourceId,
        videoOwnerChannelTitle,
        videoOwnerChannelId
      ]);
}

SnippetStruct createSnippetStruct({
  String? publishedAt,
  String? channelId,
  String? title,
  String? description,
  ThumbnailsAllStruct? thumbnails,
  String? channelTitle,
  String? playlistId,
  int? position,
  ResourceIdStruct? resourceId,
  String? videoOwnerChannelTitle,
  String? videoOwnerChannelId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SnippetStruct(
      publishedAt: publishedAt,
      channelId: channelId,
      title: title,
      description: description,
      thumbnails:
          thumbnails ?? (clearUnsetFields ? ThumbnailsAllStruct() : null),
      channelTitle: channelTitle,
      playlistId: playlistId,
      position: position,
      resourceId: resourceId ?? (clearUnsetFields ? ResourceIdStruct() : null),
      videoOwnerChannelTitle: videoOwnerChannelTitle,
      videoOwnerChannelId: videoOwnerChannelId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SnippetStruct? updateSnippetStruct(
  SnippetStruct? snippet, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    snippet
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSnippetStructData(
  Map<String, dynamic> firestoreData,
  SnippetStruct? snippet,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (snippet == null) {
    return;
  }
  if (snippet.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && snippet.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final snippetData = getSnippetFirestoreData(snippet, forFieldValue);
  final nestedData = snippetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = snippet.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSnippetFirestoreData(
  SnippetStruct? snippet, [
  bool forFieldValue = false,
]) {
  if (snippet == null) {
    return {};
  }
  final firestoreData = mapToFirestore(snippet.toMap());

  // Handle nested data for "thumbnails" field.
  addThumbnailsAllStructData(
    firestoreData,
    snippet.hasThumbnails() ? snippet.thumbnails : null,
    'thumbnails',
    forFieldValue,
  );

  // Handle nested data for "resourceId" field.
  addResourceIdStructData(
    firestoreData,
    snippet.hasResourceId() ? snippet.resourceId : null,
    'resourceId',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(snippet.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSnippetListFirestoreData(
  List<SnippetStruct>? snippets,
) =>
    snippets?.map((e) => getSnippetFirestoreData(e, true)).toList() ?? [];
