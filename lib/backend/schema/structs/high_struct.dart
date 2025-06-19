// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HighStruct extends FFFirebaseStruct {
  HighStruct({
    String? url,
    int? width,
    int? height,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _url = url,
        _width = width,
        _height = height,
        super(firestoreUtilData);

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "width" field.
  int? _width;
  int get width => _width ?? 0;
  set width(int? val) => _width = val;

  void incrementWidth(int amount) => width = width + amount;

  bool hasWidth() => _width != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;

  void incrementHeight(int amount) => height = height + amount;

  bool hasHeight() => _height != null;

  static HighStruct fromMap(Map<String, dynamic> data) => HighStruct(
        url: data['url'] as String?,
        width: castToType<int>(data['width']),
        height: castToType<int>(data['height']),
      );

  static HighStruct? maybeFromMap(dynamic data) =>
      data is Map ? HighStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'width': _width,
        'height': _height,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'width': serializeParam(
          _width,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
      }.withoutNulls;

  static HighStruct fromSerializableMap(Map<String, dynamic> data) =>
      HighStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'HighStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HighStruct &&
        url == other.url &&
        width == other.width &&
        height == other.height;
  }

  @override
  int get hashCode => const ListEquality().hash([url, width, height]);
}

HighStruct createHighStruct({
  String? url,
  int? width,
  int? height,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HighStruct(
      url: url,
      width: width,
      height: height,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HighStruct? updateHighStruct(
  HighStruct? high, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    high
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHighStructData(
  Map<String, dynamic> firestoreData,
  HighStruct? high,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (high == null) {
    return;
  }
  if (high.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && high.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final highData = getHighFirestoreData(high, forFieldValue);
  final nestedData = highData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = high.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHighFirestoreData(
  HighStruct? high, [
  bool forFieldValue = false,
]) {
  if (high == null) {
    return {};
  }
  final firestoreData = mapToFirestore(high.toMap());

  // Add any Firestore field values
  high.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHighListFirestoreData(
  List<HighStruct>? highs,
) =>
    highs?.map((e) => getHighFirestoreData(e, true)).toList() ?? [];
