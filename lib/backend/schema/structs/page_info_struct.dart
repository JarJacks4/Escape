// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PageInfoStruct extends FFFirebaseStruct {
  PageInfoStruct({
    int? totalResults,
    int? resultsPerPage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalResults = totalResults,
        _resultsPerPage = resultsPerPage,
        super(firestoreUtilData);

  // "totalResults" field.
  int? _totalResults;
  int get totalResults => _totalResults ?? 0;
  set totalResults(int? val) => _totalResults = val;

  void incrementTotalResults(int amount) =>
      totalResults = totalResults + amount;

  bool hasTotalResults() => _totalResults != null;

  // "resultsPerPage" field.
  int? _resultsPerPage;
  int get resultsPerPage => _resultsPerPage ?? 0;
  set resultsPerPage(int? val) => _resultsPerPage = val;

  void incrementResultsPerPage(int amount) =>
      resultsPerPage = resultsPerPage + amount;

  bool hasResultsPerPage() => _resultsPerPage != null;

  static PageInfoStruct fromMap(Map<String, dynamic> data) => PageInfoStruct(
        totalResults: castToType<int>(data['totalResults']),
        resultsPerPage: castToType<int>(data['resultsPerPage']),
      );

  static PageInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? PageInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'totalResults': _totalResults,
        'resultsPerPage': _resultsPerPage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalResults': serializeParam(
          _totalResults,
          ParamType.int,
        ),
        'resultsPerPage': serializeParam(
          _resultsPerPage,
          ParamType.int,
        ),
      }.withoutNulls;

  static PageInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageInfoStruct(
        totalResults: deserializeParam(
          data['totalResults'],
          ParamType.int,
          false,
        ),
        resultsPerPage: deserializeParam(
          data['resultsPerPage'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PageInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageInfoStruct &&
        totalResults == other.totalResults &&
        resultsPerPage == other.resultsPerPage;
  }

  @override
  int get hashCode => const ListEquality().hash([totalResults, resultsPerPage]);
}

PageInfoStruct createPageInfoStruct({
  int? totalResults,
  int? resultsPerPage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageInfoStruct(
      totalResults: totalResults,
      resultsPerPage: resultsPerPage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageInfoStruct? updatePageInfoStruct(
  PageInfoStruct? pageInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageInfoStructData(
  Map<String, dynamic> firestoreData,
  PageInfoStruct? pageInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageInfo == null) {
    return;
  }
  if (pageInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageInfoData = getPageInfoFirestoreData(pageInfo, forFieldValue);
  final nestedData = pageInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageInfoFirestoreData(
  PageInfoStruct? pageInfo, [
  bool forFieldValue = false,
]) {
  if (pageInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageInfo.toMap());

  // Add any Firestore field values
  pageInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageInfoListFirestoreData(
  List<PageInfoStruct>? pageInfos,
) =>
    pageInfos?.map((e) => getPageInfoFirestoreData(e, true)).toList() ?? [];
