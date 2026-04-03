// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnboardingGoalsStruct extends FFFirebaseStruct {
  OnboardingGoalsStruct({
    String? title,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _color = color,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static OnboardingGoalsStruct fromMap(Map<String, dynamic> data) =>
      OnboardingGoalsStruct(
        title: data['title'] as String?,
        color: getSchemaColor(data['color']),
      );

  static OnboardingGoalsStruct? maybeFromMap(dynamic data) => data is Map
      ? OnboardingGoalsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static OnboardingGoalsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OnboardingGoalsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'OnboardingGoalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OnboardingGoalsStruct &&
        title == other.title &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([title, color]);
}

OnboardingGoalsStruct createOnboardingGoalsStruct({
  String? title,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OnboardingGoalsStruct(
      title: title,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OnboardingGoalsStruct? updateOnboardingGoalsStruct(
  OnboardingGoalsStruct? onboardingGoals, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    onboardingGoals
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOnboardingGoalsStructData(
  Map<String, dynamic> firestoreData,
  OnboardingGoalsStruct? onboardingGoals,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (onboardingGoals == null) {
    return;
  }
  if (onboardingGoals.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && onboardingGoals.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final onboardingGoalsData =
      getOnboardingGoalsFirestoreData(onboardingGoals, forFieldValue);
  final nestedData =
      onboardingGoalsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = onboardingGoals.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOnboardingGoalsFirestoreData(
  OnboardingGoalsStruct? onboardingGoals, [
  bool forFieldValue = false,
]) {
  if (onboardingGoals == null) {
    return {};
  }
  final firestoreData = mapToFirestore(onboardingGoals.toMap());

  // Add any Firestore field values
  mapToFirestore(onboardingGoals.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOnboardingGoalsListFirestoreData(
  List<OnboardingGoalsStruct>? onboardingGoalss,
) =>
    onboardingGoalss
        ?.map((e) => getOnboardingGoalsFirestoreData(e, true))
        .toList() ??
    [];
