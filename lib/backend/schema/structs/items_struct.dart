// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends FFFirebaseStruct {
  ItemsStruct({
    String? kind,
    String? etag,
    String? id,
    SnippetStruct? snippet,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _kind = kind,
        _etag = etag,
        _id = id,
        _snippet = snippet,
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

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "snippet" field.
  SnippetStruct? _snippet;
  SnippetStruct get snippet => _snippet ?? SnippetStruct();
  set snippet(SnippetStruct? val) => _snippet = val;

  void updateSnippet(Function(SnippetStruct) updateFn) {
    updateFn(_snippet ??= SnippetStruct());
  }

  bool hasSnippet() => _snippet != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        kind: data['kind'] as String?,
        etag: data['etag'] as String?,
        id: data['id'] as String?,
        snippet: data['snippet'] is SnippetStruct
            ? data['snippet']
            : SnippetStruct.maybeFromMap(data['snippet']),
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'kind': _kind,
        'etag': _etag,
        'id': _id,
        'snippet': _snippet?.toMap(),
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
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'snippet': serializeParam(
          _snippet,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
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
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        snippet: deserializeStructParam(
          data['snippet'],
          ParamType.DataStruct,
          false,
          structBuilder: SnippetStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        kind == other.kind &&
        etag == other.etag &&
        id == other.id &&
        snippet == other.snippet;
  }

  @override
  int get hashCode => const ListEquality().hash([kind, etag, id, snippet]);
}

ItemsStruct createItemsStruct({
  String? kind,
  String? etag,
  String? id,
  SnippetStruct? snippet,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemsStruct(
      kind: kind,
      etag: etag,
      id: id,
      snippet: snippet ?? (clearUnsetFields ? SnippetStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemsStruct? updateItemsStruct(
  ItemsStruct? items, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    items
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemsStructData(
  Map<String, dynamic> firestoreData,
  ItemsStruct? items,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (items == null) {
    return;
  }
  if (items.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && items.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemsData = getItemsFirestoreData(items, forFieldValue);
  final nestedData = itemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = items.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemsFirestoreData(
  ItemsStruct? items, [
  bool forFieldValue = false,
]) {
  if (items == null) {
    return {};
  }
  final firestoreData = mapToFirestore(items.toMap());

  // Handle nested data for "snippet" field.
  addSnippetStructData(
    firestoreData,
    items.hasSnippet() ? items.snippet : null,
    'snippet',
    forFieldValue,
  );

  // Add any Firestore field values
  items.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemsListFirestoreData(
  List<ItemsStruct>? itemss,
) =>
    itemss?.map((e) => getItemsFirestoreData(e, true)).toList() ?? [];
