// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediumStruct extends FFFirebaseStruct {
  MediumStruct({
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

  static MediumStruct fromMap(Map<String, dynamic> data) => MediumStruct(
        url: data['url'] as String?,
        width: castToType<int>(data['width']),
        height: castToType<int>(data['height']),
      );

  static MediumStruct? maybeFromMap(dynamic data) =>
      data is Map ? MediumStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static MediumStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediumStruct(
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
  String toString() => 'MediumStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediumStruct &&
        url == other.url &&
        width == other.width &&
        height == other.height;
  }

  @override
  int get hashCode => const ListEquality().hash([url, width, height]);
}

MediumStruct createMediumStruct({
  String? url,
  int? width,
  int? height,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MediumStruct(
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

MediumStruct? updateMediumStruct(
  MediumStruct? medium, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medium
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMediumStructData(
  Map<String, dynamic> firestoreData,
  MediumStruct? medium,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medium == null) {
    return;
  }
  if (medium.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medium.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mediumData = getMediumFirestoreData(medium, forFieldValue);
  final nestedData = mediumData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medium.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMediumFirestoreData(
  MediumStruct? medium, [
  bool forFieldValue = false,
]) {
  if (medium == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medium.toMap());

  // Add any Firestore field values
  mapToFirestore(medium.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMediumListFirestoreData(
  List<MediumStruct>? mediums,
) =>
    mediums?.map((e) => getMediumFirestoreData(e, true)).toList() ?? [];
