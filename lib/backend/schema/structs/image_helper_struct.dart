// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageHelperStruct extends FFFirebaseStruct {
  ImageHelperStruct({
    bool? isRemoved,
    List<int>? imageData,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isRemoved = isRemoved,
        _imageData = imageData,
        _image = image,
        super(firestoreUtilData);

  // "isRemoved" field.
  bool? _isRemoved;
  bool get isRemoved => _isRemoved ?? false;
  set isRemoved(bool? val) => _isRemoved = val;

  bool hasIsRemoved() => _isRemoved != null;

  // "imageData" field.
  List<int>? _imageData;
  List<int> get imageData => _imageData ?? const [];
  set imageData(List<int>? val) => _imageData = val;

  void updateImageData(Function(List<int>) updateFn) {
    updateFn(_imageData ??= []);
  }

  bool hasImageData() => _imageData != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static ImageHelperStruct fromMap(Map<String, dynamic> data) =>
      ImageHelperStruct(
        isRemoved: data['isRemoved'] as bool?,
        imageData: getDataList(data['imageData']),
        image: data['image'] as String?,
      );

  static ImageHelperStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageHelperStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isRemoved': _isRemoved,
        'imageData': _imageData,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isRemoved': serializeParam(
          _isRemoved,
          ParamType.bool,
        ),
        'imageData': serializeParam(
          _imageData,
          ParamType.int,
          isList: true,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageHelperStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageHelperStruct(
        isRemoved: deserializeParam(
          data['isRemoved'],
          ParamType.bool,
          false,
        ),
        imageData: deserializeParam<int>(
          data['imageData'],
          ParamType.int,
          true,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageHelperStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ImageHelperStruct &&
        isRemoved == other.isRemoved &&
        listEquality.equals(imageData, other.imageData) &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([isRemoved, imageData, image]);
}

ImageHelperStruct createImageHelperStruct({
  bool? isRemoved,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageHelperStruct(
      isRemoved: isRemoved,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageHelperStruct? updateImageHelperStruct(
  ImageHelperStruct? imageHelper, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageHelper
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageHelperStructData(
  Map<String, dynamic> firestoreData,
  ImageHelperStruct? imageHelper,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageHelper == null) {
    return;
  }
  if (imageHelper.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageHelper.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageHelperData =
      getImageHelperFirestoreData(imageHelper, forFieldValue);
  final nestedData =
      imageHelperData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageHelper.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageHelperFirestoreData(
  ImageHelperStruct? imageHelper, [
  bool forFieldValue = false,
]) {
  if (imageHelper == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageHelper.toMap());

  // Add any Firestore field values
  imageHelper.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageHelperListFirestoreData(
  List<ImageHelperStruct>? imageHelpers,
) =>
    imageHelpers?.map((e) => getImageHelperFirestoreData(e, true)).toList() ??
    [];
