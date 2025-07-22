// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContextMenuItemStruct extends FFFirebaseStruct {
  ContextMenuItemStruct({
    String? label,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  static ContextMenuItemStruct fromMap(Map<String, dynamic> data) =>
      ContextMenuItemStruct(
        label: data['label'] as String?,
      );

  static ContextMenuItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ContextMenuItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContextMenuItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContextMenuItemStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContextMenuItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContextMenuItemStruct && label == other.label;
  }

  @override
  int get hashCode => const ListEquality().hash([label]);
}

ContextMenuItemStruct createContextMenuItemStruct({
  String? label,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContextMenuItemStruct(
      label: label,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContextMenuItemStruct? updateContextMenuItemStruct(
  ContextMenuItemStruct? contextMenuItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contextMenuItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContextMenuItemStructData(
  Map<String, dynamic> firestoreData,
  ContextMenuItemStruct? contextMenuItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contextMenuItem == null) {
    return;
  }
  if (contextMenuItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contextMenuItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contextMenuItemData =
      getContextMenuItemFirestoreData(contextMenuItem, forFieldValue);
  final nestedData =
      contextMenuItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contextMenuItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContextMenuItemFirestoreData(
  ContextMenuItemStruct? contextMenuItem, [
  bool forFieldValue = false,
]) {
  if (contextMenuItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contextMenuItem.toMap());

  // Add any Firestore field values
  contextMenuItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContextMenuItemListFirestoreData(
  List<ContextMenuItemStruct>? contextMenuItems,
) =>
    contextMenuItems
        ?.map((e) => getContextMenuItemFirestoreData(e, true))
        .toList() ??
    [];
