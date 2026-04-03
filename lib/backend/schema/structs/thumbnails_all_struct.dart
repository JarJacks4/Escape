// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThumbnailsAllStruct extends FFFirebaseStruct {
  ThumbnailsAllStruct({
    DefaultThumbnailsStruct? defaultThumbnails,
    MediumStruct? medium,
    HighStruct? high,
    StandardStruct? standard,
    MaxresStruct? maxres,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _defaultThumbnails = defaultThumbnails,
        _medium = medium,
        _high = high,
        _standard = standard,
        _maxres = maxres,
        super(firestoreUtilData);

  // "defaultThumbnails" field.
  DefaultThumbnailsStruct? _defaultThumbnails;
  DefaultThumbnailsStruct get defaultThumbnails =>
      _defaultThumbnails ?? DefaultThumbnailsStruct();
  set defaultThumbnails(DefaultThumbnailsStruct? val) =>
      _defaultThumbnails = val;

  void updateDefaultThumbnails(Function(DefaultThumbnailsStruct) updateFn) {
    updateFn(_defaultThumbnails ??= DefaultThumbnailsStruct());
  }

  bool hasDefaultThumbnails() => _defaultThumbnails != null;

  // "medium" field.
  MediumStruct? _medium;
  MediumStruct get medium => _medium ?? MediumStruct();
  set medium(MediumStruct? val) => _medium = val;

  void updateMedium(Function(MediumStruct) updateFn) {
    updateFn(_medium ??= MediumStruct());
  }

  bool hasMedium() => _medium != null;

  // "high" field.
  HighStruct? _high;
  HighStruct get high => _high ?? HighStruct();
  set high(HighStruct? val) => _high = val;

  void updateHigh(Function(HighStruct) updateFn) {
    updateFn(_high ??= HighStruct());
  }

  bool hasHigh() => _high != null;

  // "standard" field.
  StandardStruct? _standard;
  StandardStruct get standard => _standard ?? StandardStruct();
  set standard(StandardStruct? val) => _standard = val;

  void updateStandard(Function(StandardStruct) updateFn) {
    updateFn(_standard ??= StandardStruct());
  }

  bool hasStandard() => _standard != null;

  // "maxres" field.
  MaxresStruct? _maxres;
  MaxresStruct get maxres => _maxres ?? MaxresStruct();
  set maxres(MaxresStruct? val) => _maxres = val;

  void updateMaxres(Function(MaxresStruct) updateFn) {
    updateFn(_maxres ??= MaxresStruct());
  }

  bool hasMaxres() => _maxres != null;

  static ThumbnailsAllStruct fromMap(Map<String, dynamic> data) =>
      ThumbnailsAllStruct(
        defaultThumbnails: data['defaultThumbnails'] is DefaultThumbnailsStruct
            ? data['defaultThumbnails']
            : DefaultThumbnailsStruct.maybeFromMap(data['defaultThumbnails']),
        medium: data['medium'] is MediumStruct
            ? data['medium']
            : MediumStruct.maybeFromMap(data['medium']),
        high: data['high'] is HighStruct
            ? data['high']
            : HighStruct.maybeFromMap(data['high']),
        standard: data['standard'] is StandardStruct
            ? data['standard']
            : StandardStruct.maybeFromMap(data['standard']),
        maxres: data['maxres'] is MaxresStruct
            ? data['maxres']
            : MaxresStruct.maybeFromMap(data['maxres']),
      );

  static ThumbnailsAllStruct? maybeFromMap(dynamic data) => data is Map
      ? ThumbnailsAllStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'defaultThumbnails': _defaultThumbnails?.toMap(),
        'medium': _medium?.toMap(),
        'high': _high?.toMap(),
        'standard': _standard?.toMap(),
        'maxres': _maxres?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'defaultThumbnails': serializeParam(
          _defaultThumbnails,
          ParamType.DataStruct,
        ),
        'medium': serializeParam(
          _medium,
          ParamType.DataStruct,
        ),
        'high': serializeParam(
          _high,
          ParamType.DataStruct,
        ),
        'standard': serializeParam(
          _standard,
          ParamType.DataStruct,
        ),
        'maxres': serializeParam(
          _maxres,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ThumbnailsAllStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThumbnailsAllStruct(
        defaultThumbnails: deserializeStructParam(
          data['defaultThumbnails'],
          ParamType.DataStruct,
          false,
          structBuilder: DefaultThumbnailsStruct.fromSerializableMap,
        ),
        medium: deserializeStructParam(
          data['medium'],
          ParamType.DataStruct,
          false,
          structBuilder: MediumStruct.fromSerializableMap,
        ),
        high: deserializeStructParam(
          data['high'],
          ParamType.DataStruct,
          false,
          structBuilder: HighStruct.fromSerializableMap,
        ),
        standard: deserializeStructParam(
          data['standard'],
          ParamType.DataStruct,
          false,
          structBuilder: StandardStruct.fromSerializableMap,
        ),
        maxres: deserializeStructParam(
          data['maxres'],
          ParamType.DataStruct,
          false,
          structBuilder: MaxresStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ThumbnailsAllStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThumbnailsAllStruct &&
        defaultThumbnails == other.defaultThumbnails &&
        medium == other.medium &&
        high == other.high &&
        standard == other.standard &&
        maxres == other.maxres;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([defaultThumbnails, medium, high, standard, maxres]);
}

ThumbnailsAllStruct createThumbnailsAllStruct({
  DefaultThumbnailsStruct? defaultThumbnails,
  MediumStruct? medium,
  HighStruct? high,
  StandardStruct? standard,
  MaxresStruct? maxres,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThumbnailsAllStruct(
      defaultThumbnails: defaultThumbnails ??
          (clearUnsetFields ? DefaultThumbnailsStruct() : null),
      medium: medium ?? (clearUnsetFields ? MediumStruct() : null),
      high: high ?? (clearUnsetFields ? HighStruct() : null),
      standard: standard ?? (clearUnsetFields ? StandardStruct() : null),
      maxres: maxres ?? (clearUnsetFields ? MaxresStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThumbnailsAllStruct? updateThumbnailsAllStruct(
  ThumbnailsAllStruct? thumbnailsAll, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    thumbnailsAll
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThumbnailsAllStructData(
  Map<String, dynamic> firestoreData,
  ThumbnailsAllStruct? thumbnailsAll,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (thumbnailsAll == null) {
    return;
  }
  if (thumbnailsAll.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && thumbnailsAll.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final thumbnailsAllData =
      getThumbnailsAllFirestoreData(thumbnailsAll, forFieldValue);
  final nestedData =
      thumbnailsAllData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = thumbnailsAll.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThumbnailsAllFirestoreData(
  ThumbnailsAllStruct? thumbnailsAll, [
  bool forFieldValue = false,
]) {
  if (thumbnailsAll == null) {
    return {};
  }
  final firestoreData = mapToFirestore(thumbnailsAll.toMap());

  // Handle nested data for "defaultThumbnails" field.
  addDefaultThumbnailsStructData(
    firestoreData,
    thumbnailsAll.hasDefaultThumbnails()
        ? thumbnailsAll.defaultThumbnails
        : null,
    'defaultThumbnails',
    forFieldValue,
  );

  // Handle nested data for "medium" field.
  addMediumStructData(
    firestoreData,
    thumbnailsAll.hasMedium() ? thumbnailsAll.medium : null,
    'medium',
    forFieldValue,
  );

  // Handle nested data for "high" field.
  addHighStructData(
    firestoreData,
    thumbnailsAll.hasHigh() ? thumbnailsAll.high : null,
    'high',
    forFieldValue,
  );

  // Handle nested data for "standard" field.
  addStandardStructData(
    firestoreData,
    thumbnailsAll.hasStandard() ? thumbnailsAll.standard : null,
    'standard',
    forFieldValue,
  );

  // Handle nested data for "maxres" field.
  addMaxresStructData(
    firestoreData,
    thumbnailsAll.hasMaxres() ? thumbnailsAll.maxres : null,
    'maxres',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(thumbnailsAll.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThumbnailsAllListFirestoreData(
  List<ThumbnailsAllStruct>? thumbnailsAlls,
) =>
    thumbnailsAlls
        ?.map((e) => getThumbnailsAllFirestoreData(e, true))
        .toList() ??
    [];
