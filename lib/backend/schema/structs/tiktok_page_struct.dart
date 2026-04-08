// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TiktokPageStruct extends FFFirebaseStruct {
  TiktokPageStruct({
    String? video,
    List<String>? likes,
    List<String>? bookmark,
    int? id,
    String? urlVideo,
    String? userPicture,
    String? profileName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _video = video,
        _likes = likes,
        _bookmark = bookmark,
        _id = id,
        _urlVideo = urlVideo,
        _userPicture = userPicture,
        _profileName = profileName,
        super(firestoreUtilData);

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;

  bool hasVideo() => _video != null;

  // "likes" field.
  List<String>? _likes;
  List<String> get likes => _likes ?? const [];
  set likes(List<String>? val) => _likes = val;

  void updateLikes(Function(List<String>) updateFn) {
    updateFn(_likes ??= []);
  }

  bool hasLikes() => _likes != null;

  // "bookmark" field.
  List<String>? _bookmark;
  List<String> get bookmark => _bookmark ?? const [];
  set bookmark(List<String>? val) => _bookmark = val;

  void updateBookmark(Function(List<String>) updateFn) {
    updateFn(_bookmark ??= []);
  }

  bool hasBookmark() => _bookmark != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "urlVideo" field.
  String? _urlVideo;
  String get urlVideo => _urlVideo ?? '';
  set urlVideo(String? val) => _urlVideo = val;

  bool hasUrlVideo() => _urlVideo != null;

  // "userPicture" field.
  String? _userPicture;
  String get userPicture => _userPicture ?? '';
  set userPicture(String? val) => _userPicture = val;

  bool hasUserPicture() => _userPicture != null;

  // "profileName" field.
  String? _profileName;
  String get profileName => _profileName ?? '';
  set profileName(String? val) => _profileName = val;

  bool hasProfileName() => _profileName != null;

  static TiktokPageStruct fromMap(Map<String, dynamic> data) =>
      TiktokPageStruct(
        video: data['video'] as String?,
        likes: getDataList(data['likes']),
        bookmark: getDataList(data['bookmark']),
        id: castToType<int>(data['id']),
        urlVideo: data['urlVideo'] as String?,
        userPicture: data['userPicture'] as String?,
        profileName: data['profileName'] as String?,
      );

  static TiktokPageStruct? maybeFromMap(dynamic data) => data is Map
      ? TiktokPageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'video': _video,
        'likes': _likes,
        'bookmark': _bookmark,
        'id': _id,
        'urlVideo': _urlVideo,
        'userPicture': _userPicture,
        'profileName': _profileName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.String,
          isList: true,
        ),
        'bookmark': serializeParam(
          _bookmark,
          ParamType.String,
          isList: true,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'urlVideo': serializeParam(
          _urlVideo,
          ParamType.String,
        ),
        'userPicture': serializeParam(
          _userPicture,
          ParamType.String,
        ),
        'profileName': serializeParam(
          _profileName,
          ParamType.String,
        ),
      }.withoutNulls;

  static TiktokPageStruct fromSerializableMap(Map<String, dynamic> data) =>
      TiktokPageStruct(
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
        likes: deserializeParam<String>(
          data['likes'],
          ParamType.String,
          true,
        ),
        bookmark: deserializeParam<String>(
          data['bookmark'],
          ParamType.String,
          true,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        urlVideo: deserializeParam(
          data['urlVideo'],
          ParamType.String,
          false,
        ),
        userPicture: deserializeParam(
          data['userPicture'],
          ParamType.String,
          false,
        ),
        profileName: deserializeParam(
          data['profileName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TiktokPageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TiktokPageStruct &&
        video == other.video &&
        listEquality.equals(likes, other.likes) &&
        listEquality.equals(bookmark, other.bookmark) &&
        id == other.id &&
        urlVideo == other.urlVideo &&
        userPicture == other.userPicture &&
        profileName == other.profileName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([video, likes, bookmark, id, urlVideo, userPicture, profileName]);
}

TiktokPageStruct createTiktokPageStruct({
  String? video,
  int? id,
  String? urlVideo,
  String? userPicture,
  String? profileName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TiktokPageStruct(
      video: video,
      id: id,
      urlVideo: urlVideo,
      userPicture: userPicture,
      profileName: profileName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TiktokPageStruct? updateTiktokPageStruct(
  TiktokPageStruct? tiktokPage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tiktokPage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTiktokPageStructData(
  Map<String, dynamic> firestoreData,
  TiktokPageStruct? tiktokPage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tiktokPage == null) {
    return;
  }
  if (tiktokPage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tiktokPage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tiktokPageData = getTiktokPageFirestoreData(tiktokPage, forFieldValue);
  final nestedData = tiktokPageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tiktokPage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTiktokPageFirestoreData(
  TiktokPageStruct? tiktokPage, [
  bool forFieldValue = false,
]) {
  if (tiktokPage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tiktokPage.toMap());

  // Add any Firestore field values
  mapToFirestore(tiktokPage.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTiktokPageListFirestoreData(
  List<TiktokPageStruct>? tiktokPages,
) =>
    tiktokPages?.map((e) => getTiktokPageFirestoreData(e, true)).toList() ?? [];
