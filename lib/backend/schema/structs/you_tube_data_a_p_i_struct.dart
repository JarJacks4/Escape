// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YouTubeDataAPIStruct extends FFFirebaseStruct {
  YouTubeDataAPIStruct({
    String? kind,
    String? etag,
    String? nextPageToken,
    List<ItemsStruct>? items,
    PageInfoStruct? pageInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _kind = kind,
        _etag = etag,
        _nextPageToken = nextPageToken,
        _items = items,
        _pageInfo = pageInfo,
        super(firestoreUtilData);

  // "kind" field.
  String? _kind;
  String get kind => _kind ?? '';
  set kind(String? val) => _kind = val;

  bool hasKind() => _kind != null;

  // "etag" field.
  String? _etag;
  String get etag => _etag ?? '';
  set etag(String? val) => _etag = val;

  bool hasEtag() => _etag != null;

  // "nextPageToken" field.
  String? _nextPageToken;
  String get nextPageToken => _nextPageToken ?? '';
  set nextPageToken(String? val) => _nextPageToken = val;

  bool hasNextPageToken() => _nextPageToken != null;

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  set items(List<ItemsStruct>? val) => _items = val;

  void updateItems(Function(List<ItemsStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  // "pageInfo" field.
  PageInfoStruct? _pageInfo;
  PageInfoStruct get pageInfo => _pageInfo ?? PageInfoStruct();
  set pageInfo(PageInfoStruct? val) => _pageInfo = val;

  void updatePageInfo(Function(PageInfoStruct) updateFn) {
    updateFn(_pageInfo ??= PageInfoStruct());
  }

  bool hasPageInfo() => _pageInfo != null;

  static YouTubeDataAPIStruct fromMap(Map<String, dynamic> data) =>
      YouTubeDataAPIStruct(
        kind: data['kind'] as String?,
        etag: data['etag'] as String?,
        nextPageToken: data['nextPageToken'] as String?,
        items: getStructList(
          data['items'],
          ItemsStruct.fromMap,
        ),
        pageInfo: data['pageInfo'] is PageInfoStruct
            ? data['pageInfo']
            : PageInfoStruct.maybeFromMap(data['pageInfo']),
      );

  static YouTubeDataAPIStruct? maybeFromMap(dynamic data) => data is Map
      ? YouTubeDataAPIStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'kind': _kind,
        'etag': _etag,
        'nextPageToken': _nextPageToken,
        'items': _items?.map((e) => e.toMap()).toList(),
        'pageInfo': _pageInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'kind': serializeParam(
          _kind,
          ParamType.String,
        ),
        'etag': serializeParam(
          _etag,
          ParamType.String,
        ),
        'nextPageToken': serializeParam(
          _nextPageToken,
          ParamType.String,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
        'pageInfo': serializeParam(
          _pageInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static YouTubeDataAPIStruct fromSerializableMap(Map<String, dynamic> data) =>
      YouTubeDataAPIStruct(
        kind: deserializeParam(
          data['kind'],
          ParamType.String,
          false,
        ),
        etag: deserializeParam(
          data['etag'],
          ParamType.String,
          false,
        ),
        nextPageToken: deserializeParam(
          data['nextPageToken'],
          ParamType.String,
          false,
        ),
        items: deserializeStructParam<ItemsStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemsStruct.fromSerializableMap,
        ),
        pageInfo: deserializeStructParam(
          data['pageInfo'],
          ParamType.DataStruct,
          false,
          structBuilder: PageInfoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'YouTubeDataAPIStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is YouTubeDataAPIStruct &&
        kind == other.kind &&
        etag == other.etag &&
        nextPageToken == other.nextPageToken &&
        listEquality.equals(items, other.items) &&
        pageInfo == other.pageInfo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([kind, etag, nextPageToken, items, pageInfo]);
}

YouTubeDataAPIStruct createYouTubeDataAPIStruct({
  String? kind,
  String? etag,
  String? nextPageToken,
  PageInfoStruct? pageInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    YouTubeDataAPIStruct(
      kind: kind,
      etag: etag,
      nextPageToken: nextPageToken,
      pageInfo: pageInfo ?? (clearUnsetFields ? PageInfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

YouTubeDataAPIStruct? updateYouTubeDataAPIStruct(
  YouTubeDataAPIStruct? youTubeDataAPI, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    youTubeDataAPI
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addYouTubeDataAPIStructData(
  Map<String, dynamic> firestoreData,
  YouTubeDataAPIStruct? youTubeDataAPI,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (youTubeDataAPI == null) {
    return;
  }
  if (youTubeDataAPI.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && youTubeDataAPI.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final youTubeDataAPIData =
      getYouTubeDataAPIFirestoreData(youTubeDataAPI, forFieldValue);
  final nestedData =
      youTubeDataAPIData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = youTubeDataAPI.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getYouTubeDataAPIFirestoreData(
  YouTubeDataAPIStruct? youTubeDataAPI, [
  bool forFieldValue = false,
]) {
  if (youTubeDataAPI == null) {
    return {};
  }
  final firestoreData = mapToFirestore(youTubeDataAPI.toMap());

  // Handle nested data for "pageInfo" field.
  addPageInfoStructData(
    firestoreData,
    youTubeDataAPI.hasPageInfo() ? youTubeDataAPI.pageInfo : null,
    'pageInfo',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(youTubeDataAPI.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getYouTubeDataAPIListFirestoreData(
  List<YouTubeDataAPIStruct>? youTubeDataAPIs,
) =>
    youTubeDataAPIs
        ?.map((e) => getYouTubeDataAPIFirestoreData(e, true))
        .toList() ??
    [];
