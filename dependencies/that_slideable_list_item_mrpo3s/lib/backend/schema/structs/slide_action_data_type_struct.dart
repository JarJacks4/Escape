// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SlideActionDataTypeStruct extends FFFirebaseStruct {
  SlideActionDataTypeStruct({
    Color? backgroundColor,
    Color? foregroundColor,
    int? flex,
    String? label,
    bool? autoClose,
    double? spacing,
    double? borderRadius,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _backgroundColor = backgroundColor,
        _foregroundColor = foregroundColor,
        _flex = flex,
        _label = label,
        _autoClose = autoClose,
        _spacing = spacing,
        _borderRadius = borderRadius,
        super(firestoreUtilData);

  // "backgroundColor" field.
  Color? _backgroundColor;
  Color? get backgroundColor => _backgroundColor;
  set backgroundColor(Color? val) => _backgroundColor = val;

  bool hasBackgroundColor() => _backgroundColor != null;

  // "foregroundColor" field.
  Color? _foregroundColor;
  Color? get foregroundColor => _foregroundColor;
  set foregroundColor(Color? val) => _foregroundColor = val;

  bool hasForegroundColor() => _foregroundColor != null;

  // "flex" field.
  int? _flex;
  int get flex => _flex ?? 1;
  set flex(int? val) => _flex = val;

  void incrementFlex(int amount) => flex = flex + amount;

  bool hasFlex() => _flex != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "autoClose" field.
  bool? _autoClose;
  bool get autoClose => _autoClose ?? false;
  set autoClose(bool? val) => _autoClose = val;

  bool hasAutoClose() => _autoClose != null;

  // "spacing" field.
  double? _spacing;
  double get spacing => _spacing ?? 2.0;
  set spacing(double? val) => _spacing = val;

  void incrementSpacing(double amount) => spacing = spacing + amount;

  bool hasSpacing() => _spacing != null;

  // "borderRadius" field.
  double? _borderRadius;
  double get borderRadius => _borderRadius ?? 0.0;
  set borderRadius(double? val) => _borderRadius = val;

  void incrementBorderRadius(double amount) =>
      borderRadius = borderRadius + amount;

  bool hasBorderRadius() => _borderRadius != null;

  static SlideActionDataTypeStruct fromMap(Map<String, dynamic> data) =>
      SlideActionDataTypeStruct(
        backgroundColor: getSchemaColor(data['backgroundColor']),
        foregroundColor: getSchemaColor(data['foregroundColor']),
        flex: castToType<int>(data['flex']),
        label: data['label'] as String?,
        autoClose: data['autoClose'] as bool?,
        spacing: castToType<double>(data['spacing']),
        borderRadius: castToType<double>(data['borderRadius']),
      );

  static SlideActionDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? SlideActionDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'backgroundColor': _backgroundColor,
        'foregroundColor': _foregroundColor,
        'flex': _flex,
        'label': _label,
        'autoClose': _autoClose,
        'spacing': _spacing,
        'borderRadius': _borderRadius,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'backgroundColor': serializeParam(
          _backgroundColor,
          ParamType.Color,
        ),
        'foregroundColor': serializeParam(
          _foregroundColor,
          ParamType.Color,
        ),
        'flex': serializeParam(
          _flex,
          ParamType.int,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'autoClose': serializeParam(
          _autoClose,
          ParamType.bool,
        ),
        'spacing': serializeParam(
          _spacing,
          ParamType.double,
        ),
        'borderRadius': serializeParam(
          _borderRadius,
          ParamType.double,
        ),
      }.withoutNulls;

  static SlideActionDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SlideActionDataTypeStruct(
        backgroundColor: deserializeParam(
          data['backgroundColor'],
          ParamType.Color,
          false,
        ),
        foregroundColor: deserializeParam(
          data['foregroundColor'],
          ParamType.Color,
          false,
        ),
        flex: deserializeParam(
          data['flex'],
          ParamType.int,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        autoClose: deserializeParam(
          data['autoClose'],
          ParamType.bool,
          false,
        ),
        spacing: deserializeParam(
          data['spacing'],
          ParamType.double,
          false,
        ),
        borderRadius: deserializeParam(
          data['borderRadius'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SlideActionDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SlideActionDataTypeStruct &&
        backgroundColor == other.backgroundColor &&
        foregroundColor == other.foregroundColor &&
        flex == other.flex &&
        label == other.label &&
        autoClose == other.autoClose &&
        spacing == other.spacing &&
        borderRadius == other.borderRadius;
  }

  @override
  int get hashCode => const ListEquality().hash([
        backgroundColor,
        foregroundColor,
        flex,
        label,
        autoClose,
        spacing,
        borderRadius
      ]);
}

SlideActionDataTypeStruct createSlideActionDataTypeStruct({
  Color? backgroundColor,
  Color? foregroundColor,
  int? flex,
  String? label,
  bool? autoClose,
  double? spacing,
  double? borderRadius,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SlideActionDataTypeStruct(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      flex: flex,
      label: label,
      autoClose: autoClose,
      spacing: spacing,
      borderRadius: borderRadius,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SlideActionDataTypeStruct? updateSlideActionDataTypeStruct(
  SlideActionDataTypeStruct? slideActionDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    slideActionDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSlideActionDataTypeStructData(
  Map<String, dynamic> firestoreData,
  SlideActionDataTypeStruct? slideActionDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (slideActionDataType == null) {
    return;
  }
  if (slideActionDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && slideActionDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final slideActionDataTypeData =
      getSlideActionDataTypeFirestoreData(slideActionDataType, forFieldValue);
  final nestedData =
      slideActionDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      slideActionDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSlideActionDataTypeFirestoreData(
  SlideActionDataTypeStruct? slideActionDataType, [
  bool forFieldValue = false,
]) {
  if (slideActionDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(slideActionDataType.toMap());

  // Add any Firestore field values
  mapToFirestore(slideActionDataType.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSlideActionDataTypeListFirestoreData(
  List<SlideActionDataTypeStruct>? slideActionDataTypes,
) =>
    slideActionDataTypes
        ?.map((e) => getSlideActionDataTypeFirestoreData(e, true))
        .toList() ??
    [];
