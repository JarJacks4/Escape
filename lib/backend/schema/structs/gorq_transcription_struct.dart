// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GorqTranscriptionStruct extends FFFirebaseStruct {
  GorqTranscriptionStruct({
    String? text,
    XGroqStruct? xGroq,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _xGroq = xGroq,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "x_groq" field.
  XGroqStruct? _xGroq;
  XGroqStruct get xGroq => _xGroq ?? XGroqStruct();
  set xGroq(XGroqStruct? val) => _xGroq = val;

  void updateXGroq(Function(XGroqStruct) updateFn) {
    updateFn(_xGroq ??= XGroqStruct());
  }

  bool hasXGroq() => _xGroq != null;

  static GorqTranscriptionStruct fromMap(Map<String, dynamic> data) =>
      GorqTranscriptionStruct(
        text: data['text'] as String?,
        xGroq: data['x_groq'] is XGroqStruct
            ? data['x_groq']
            : XGroqStruct.maybeFromMap(data['x_groq']),
      );

  static GorqTranscriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? GorqTranscriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'x_groq': _xGroq?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'x_groq': serializeParam(
          _xGroq,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static GorqTranscriptionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GorqTranscriptionStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        xGroq: deserializeStructParam(
          data['x_groq'],
          ParamType.DataStruct,
          false,
          structBuilder: XGroqStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GorqTranscriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GorqTranscriptionStruct &&
        text == other.text &&
        xGroq == other.xGroq;
  }

  @override
  int get hashCode => const ListEquality().hash([text, xGroq]);
}

GorqTranscriptionStruct createGorqTranscriptionStruct({
  String? text,
  XGroqStruct? xGroq,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GorqTranscriptionStruct(
      text: text,
      xGroq: xGroq ?? (clearUnsetFields ? XGroqStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GorqTranscriptionStruct? updateGorqTranscriptionStruct(
  GorqTranscriptionStruct? gorqTranscription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gorqTranscription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGorqTranscriptionStructData(
  Map<String, dynamic> firestoreData,
  GorqTranscriptionStruct? gorqTranscription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gorqTranscription == null) {
    return;
  }
  if (gorqTranscription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gorqTranscription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gorqTranscriptionData =
      getGorqTranscriptionFirestoreData(gorqTranscription, forFieldValue);
  final nestedData =
      gorqTranscriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gorqTranscription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGorqTranscriptionFirestoreData(
  GorqTranscriptionStruct? gorqTranscription, [
  bool forFieldValue = false,
]) {
  if (gorqTranscription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gorqTranscription.toMap());

  // Handle nested data for "x_groq" field.
  addXGroqStructData(
    firestoreData,
    gorqTranscription.hasXGroq() ? gorqTranscription.xGroq : null,
    'x_groq',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(gorqTranscription.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGorqTranscriptionListFirestoreData(
  List<GorqTranscriptionStruct>? gorqTranscriptions,
) =>
    gorqTranscriptions
        ?.map((e) => getGorqTranscriptionFirestoreData(e, true))
        .toList() ??
    [];
