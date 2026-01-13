// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuildShipStreamStruct extends FFFirebaseStruct {
  BuildShipStreamStruct({
    String? data,
    String? delta,
    String? response,
    int? statusCode,
    int? messageCount,
    Role? message,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        _delta = delta,
        _response = response,
        _statusCode = statusCode,
        _messageCount = messageCount,
        _message = message,
        super(firestoreUtilData);

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "delta" field.
  String? _delta;
  String get delta => _delta ?? '';
  set delta(String? val) => _delta = val;

  bool hasDelta() => _delta != null;

  // "Response" field.
  String? _response;
  String get response => _response ?? '';
  set response(String? val) => _response = val;

  bool hasResponse() => _response != null;

  // "StatusCode" field.
  int? _statusCode;
  int get statusCode => _statusCode ?? 0;
  set statusCode(int? val) => _statusCode = val;

  void incrementStatusCode(int amount) => statusCode = statusCode + amount;

  bool hasStatusCode() => _statusCode != null;

  // "MessageCount" field.
  int? _messageCount;
  int get messageCount => _messageCount ?? 0;
  set messageCount(int? val) => _messageCount = val;

  void incrementMessageCount(int amount) =>
      messageCount = messageCount + amount;

  bool hasMessageCount() => _messageCount != null;

  // "Message" field.
  Role? _message;
  Role? get message => _message;
  set message(Role? val) => _message = val;

  bool hasMessage() => _message != null;

  static BuildShipStreamStruct fromMap(Map<String, dynamic> data) =>
      BuildShipStreamStruct(
        data: data['data'] as String?,
        delta: data['delta'] as String?,
        response: data['Response'] as String?,
        statusCode: castToType<int>(data['StatusCode']),
        messageCount: castToType<int>(data['MessageCount']),
        message: data['Message'] is Role
            ? data['Message']
            : deserializeEnum<Role>(data['Message']),
      );

  static BuildShipStreamStruct? maybeFromMap(dynamic data) => data is Map
      ? BuildShipStreamStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'delta': _delta,
        'Response': _response,
        'StatusCode': _statusCode,
        'MessageCount': _messageCount,
        'Message': _message?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
        'delta': serializeParam(
          _delta,
          ParamType.String,
        ),
        'Response': serializeParam(
          _response,
          ParamType.String,
        ),
        'StatusCode': serializeParam(
          _statusCode,
          ParamType.int,
        ),
        'MessageCount': serializeParam(
          _messageCount,
          ParamType.int,
        ),
        'Message': serializeParam(
          _message,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static BuildShipStreamStruct fromSerializableMap(Map<String, dynamic> data) =>
      BuildShipStreamStruct(
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
        delta: deserializeParam(
          data['delta'],
          ParamType.String,
          false,
        ),
        response: deserializeParam(
          data['Response'],
          ParamType.String,
          false,
        ),
        statusCode: deserializeParam(
          data['StatusCode'],
          ParamType.int,
          false,
        ),
        messageCount: deserializeParam(
          data['MessageCount'],
          ParamType.int,
          false,
        ),
        message: deserializeParam<Role>(
          data['Message'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'BuildShipStreamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BuildShipStreamStruct &&
        data == other.data &&
        delta == other.delta &&
        response == other.response &&
        statusCode == other.statusCode &&
        messageCount == other.messageCount &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([data, delta, response, statusCode, messageCount, message]);
}

BuildShipStreamStruct createBuildShipStreamStruct({
  String? data,
  String? delta,
  String? response,
  int? statusCode,
  int? messageCount,
  Role? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BuildShipStreamStruct(
      data: data,
      delta: delta,
      response: response,
      statusCode: statusCode,
      messageCount: messageCount,
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BuildShipStreamStruct? updateBuildShipStreamStruct(
  BuildShipStreamStruct? buildShipStream, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    buildShipStream
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBuildShipStreamStructData(
  Map<String, dynamic> firestoreData,
  BuildShipStreamStruct? buildShipStream,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buildShipStream == null) {
    return;
  }
  if (buildShipStream.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && buildShipStream.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buildShipStreamData =
      getBuildShipStreamFirestoreData(buildShipStream, forFieldValue);
  final nestedData =
      buildShipStreamData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = buildShipStream.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBuildShipStreamFirestoreData(
  BuildShipStreamStruct? buildShipStream, [
  bool forFieldValue = false,
]) {
  if (buildShipStream == null) {
    return {};
  }
  final firestoreData = mapToFirestore(buildShipStream.toMap());

  // Add any Firestore field values
  buildShipStream.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBuildShipStreamListFirestoreData(
  List<BuildShipStreamStruct>? buildShipStreams,
) =>
    buildShipStreams
        ?.map((e) => getBuildShipStreamFirestoreData(e, true))
        .toList() ??
    [];
