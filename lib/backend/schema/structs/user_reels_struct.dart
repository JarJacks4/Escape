// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReelsStruct extends FFFirebaseStruct {
  UserReelsStruct({
    List<String>? fileName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileName = fileName,
        super(firestoreUtilData);

  // "fileName" field.
  List<String>? _fileName;
  List<String> get fileName => _fileName ?? const [];
  set fileName(List<String>? val) => _fileName = val;

  void updateFileName(Function(List<String>) updateFn) {
    updateFn(_fileName ??= []);
  }

  bool hasFileName() => _fileName != null;

  static UserReelsStruct fromMap(Map<String, dynamic> data) => UserReelsStruct(
        fileName: getDataList(data['fileName']),
      );

  static UserReelsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserReelsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fileName': _fileName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fileName': serializeParam(
          _fileName,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static UserReelsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserReelsStruct(
        fileName: deserializeParam<String>(
          data['fileName'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'UserReelsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserReelsStruct &&
        listEquality.equals(fileName, other.fileName);
  }

  @override
  int get hashCode => const ListEquality().hash([fileName]);
}

UserReelsStruct createUserReelsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserReelsStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserReelsStruct? updateUserReelsStruct(
  UserReelsStruct? userReels, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userReels
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserReelsStructData(
  Map<String, dynamic> firestoreData,
  UserReelsStruct? userReels,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userReels == null) {
    return;
  }
  if (userReels.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userReels.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userReelsData = getUserReelsFirestoreData(userReels, forFieldValue);
  final nestedData = userReelsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userReels.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserReelsFirestoreData(
  UserReelsStruct? userReels, [
  bool forFieldValue = false,
]) {
  if (userReels == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userReels.toMap());

  // Add any Firestore field values
  mapToFirestore(userReels.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserReelsListFirestoreData(
  List<UserReelsStruct>? userReelss,
) =>
    userReelss?.map((e) => getUserReelsFirestoreData(e, true)).toList() ?? [];
