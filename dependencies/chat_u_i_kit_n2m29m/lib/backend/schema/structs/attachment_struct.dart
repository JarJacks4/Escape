// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttachmentStruct extends FFFirebaseStruct {
  AttachmentStruct({
    AttachmentType? type,
    String? url,
    double? size,
    String? thumbnailUrl,
    String? fileName,
    FileExtension? fileExtension,

    /// Full size text, e.g 148 KB
    String? sizeText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _url = url,
        _size = size,
        _thumbnailUrl = thumbnailUrl,
        _fileName = fileName,
        _fileExtension = fileExtension,
        _sizeText = sizeText,
        super(firestoreUtilData);

  // "type" field.
  AttachmentType? _type;
  AttachmentType? get type => _type;
  set type(AttachmentType? val) => _type = val;

  bool hasType() => _type != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  set size(double? val) => _size = val;

  void incrementSize(double amount) => size = size + amount;

  bool hasSize() => _size != null;

  // "thumbnailUrl" field.
  String? _thumbnailUrl;
  String get thumbnailUrl => _thumbnailUrl ?? '';
  set thumbnailUrl(String? val) => _thumbnailUrl = val;

  bool hasThumbnailUrl() => _thumbnailUrl != null;

  // "fileName" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  set fileName(String? val) => _fileName = val;

  bool hasFileName() => _fileName != null;

  // "fileExtension" field.
  FileExtension? _fileExtension;
  FileExtension? get fileExtension => _fileExtension;
  set fileExtension(FileExtension? val) => _fileExtension = val;

  bool hasFileExtension() => _fileExtension != null;

  // "sizeText" field.
  String? _sizeText;
  String get sizeText => _sizeText ?? '';
  set sizeText(String? val) => _sizeText = val;

  bool hasSizeText() => _sizeText != null;

  static AttachmentStruct fromMap(Map<String, dynamic> data) =>
      AttachmentStruct(
        type: data['type'] is AttachmentType
            ? data['type']
            : deserializeEnum<AttachmentType>(data['type']),
        url: data['url'] as String?,
        size: castToType<double>(data['size']),
        thumbnailUrl: data['thumbnailUrl'] as String?,
        fileName: data['fileName'] as String?,
        fileExtension: data['fileExtension'] is FileExtension
            ? data['fileExtension']
            : deserializeEnum<FileExtension>(data['fileExtension']),
        sizeText: data['sizeText'] as String?,
      );

  static AttachmentStruct? maybeFromMap(dynamic data) => data is Map
      ? AttachmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type?.serialize(),
        'url': _url,
        'size': _size,
        'thumbnailUrl': _thumbnailUrl,
        'fileName': _fileName,
        'fileExtension': _fileExtension?.serialize(),
        'sizeText': _sizeText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.double,
        ),
        'thumbnailUrl': serializeParam(
          _thumbnailUrl,
          ParamType.String,
        ),
        'fileName': serializeParam(
          _fileName,
          ParamType.String,
        ),
        'fileExtension': serializeParam(
          _fileExtension,
          ParamType.Enum,
        ),
        'sizeText': serializeParam(
          _sizeText,
          ParamType.String,
        ),
      }.withoutNulls;

  static AttachmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttachmentStruct(
        type: deserializeParam<AttachmentType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.double,
          false,
        ),
        thumbnailUrl: deserializeParam(
          data['thumbnailUrl'],
          ParamType.String,
          false,
        ),
        fileName: deserializeParam(
          data['fileName'],
          ParamType.String,
          false,
        ),
        fileExtension: deserializeParam<FileExtension>(
          data['fileExtension'],
          ParamType.Enum,
          false,
        ),
        sizeText: deserializeParam(
          data['sizeText'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AttachmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttachmentStruct &&
        type == other.type &&
        url == other.url &&
        size == other.size &&
        thumbnailUrl == other.thumbnailUrl &&
        fileName == other.fileName &&
        fileExtension == other.fileExtension &&
        sizeText == other.sizeText;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([type, url, size, thumbnailUrl, fileName, fileExtension, sizeText]);
}

AttachmentStruct createAttachmentStruct({
  AttachmentType? type,
  String? url,
  double? size,
  String? thumbnailUrl,
  String? fileName,
  FileExtension? fileExtension,
  String? sizeText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttachmentStruct(
      type: type,
      url: url,
      size: size,
      thumbnailUrl: thumbnailUrl,
      fileName: fileName,
      fileExtension: fileExtension,
      sizeText: sizeText,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttachmentStruct? updateAttachmentStruct(
  AttachmentStruct? attachment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attachment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttachmentStructData(
  Map<String, dynamic> firestoreData,
  AttachmentStruct? attachment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attachment == null) {
    return;
  }
  if (attachment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attachment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attachmentData = getAttachmentFirestoreData(attachment, forFieldValue);
  final nestedData = attachmentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attachment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttachmentFirestoreData(
  AttachmentStruct? attachment, [
  bool forFieldValue = false,
]) {
  if (attachment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attachment.toMap());

  // Add any Firestore field values
  attachment.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttachmentListFirestoreData(
  List<AttachmentStruct>? attachments,
) =>
    attachments?.map((e) => getAttachmentFirestoreData(e, true)).toList() ?? [];
