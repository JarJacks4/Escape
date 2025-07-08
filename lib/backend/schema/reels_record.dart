import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReelsRecord extends FirestoreRecord {
  ReelsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tags" field.
  int? _tags;
  int get tags => _tags ?? 0;
  bool hasTags() => _tags != null;

  // "moderationStatus" field.
  int? _moderationStatus;
  int get moderationStatus => _moderationStatus ?? 0;
  bool hasModerationStatus() => _moderationStatus != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "fileName" field.
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? _fileName;
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct get fileName =>
      _fileName ?? tiktokfeed_wz8en7_data_schema.TiktokPageStruct();
  bool hasFileName() => _fileName != null;

  // "urlVideo" field.
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? _urlVideo;
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct get urlVideo =>
      _urlVideo ?? tiktokfeed_wz8en7_data_schema.TiktokPageStruct();
  bool hasUrlVideo() => _urlVideo != null;

  // "assetTypeFirebase" field.
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? _assetTypeFirebase;
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct get assetTypeFirebase =>
      _assetTypeFirebase ?? tiktokfeed_wz8en7_data_schema.TiktokPageStruct();
  bool hasAssetTypeFirebase() => _assetTypeFirebase != null;

  // "publicId" field.
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? _publicId;
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct get publicId =>
      _publicId ?? tiktokfeed_wz8en7_data_schema.TiktokPageStruct();
  bool hasPublicId() => _publicId != null;

  // "deliveryType" field.
  String? _deliveryType;
  String get deliveryType => _deliveryType ?? '';
  bool hasDeliveryType() => _deliveryType != null;

  // "assetId" field.
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? _assetId;
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct get assetId =>
      _assetId ?? tiktokfeed_wz8en7_data_schema.TiktokPageStruct();
  bool hasAssetId() => _assetId != null;

  // "format" field.
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? _format;
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct get format =>
      _format ?? tiktokfeed_wz8en7_data_schema.TiktokPageStruct();
  bool hasFormat() => _format != null;

  // "ProfileName" field.
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? _profileName;
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct get profileName =>
      _profileName ?? tiktokfeed_wz8en7_data_schema.TiktokPageStruct();
  bool hasProfileName() => _profileName != null;

  void _initializeFields() {
    _tags = castToType<int>(snapshotData['tags']);
    _moderationStatus = castToType<int>(snapshotData['moderationStatus']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _fileName = snapshotData['fileName']
            is tiktokfeed_wz8en7_data_schema.TiktokPageStruct
        ? snapshotData['fileName']
        : tiktokfeed_wz8en7_data_schema.TiktokPageStruct.maybeFromMap(
            snapshotData['fileName']);
    _urlVideo = snapshotData['urlVideo']
            is tiktokfeed_wz8en7_data_schema.TiktokPageStruct
        ? snapshotData['urlVideo']
        : tiktokfeed_wz8en7_data_schema.TiktokPageStruct.maybeFromMap(
            snapshotData['urlVideo']);
    _assetTypeFirebase = snapshotData['assetTypeFirebase']
            is tiktokfeed_wz8en7_data_schema.TiktokPageStruct
        ? snapshotData['assetTypeFirebase']
        : tiktokfeed_wz8en7_data_schema.TiktokPageStruct.maybeFromMap(
            snapshotData['assetTypeFirebase']);
    _publicId = snapshotData['publicId']
            is tiktokfeed_wz8en7_data_schema.TiktokPageStruct
        ? snapshotData['publicId']
        : tiktokfeed_wz8en7_data_schema.TiktokPageStruct.maybeFromMap(
            snapshotData['publicId']);
    _deliveryType = snapshotData['deliveryType'] as String?;
    _assetId = snapshotData['assetId']
            is tiktokfeed_wz8en7_data_schema.TiktokPageStruct
        ? snapshotData['assetId']
        : tiktokfeed_wz8en7_data_schema.TiktokPageStruct.maybeFromMap(
            snapshotData['assetId']);
    _format =
        snapshotData['format'] is tiktokfeed_wz8en7_data_schema.TiktokPageStruct
            ? snapshotData['format']
            : tiktokfeed_wz8en7_data_schema.TiktokPageStruct.maybeFromMap(
                snapshotData['format']);
    _profileName = snapshotData['ProfileName']
            is tiktokfeed_wz8en7_data_schema.TiktokPageStruct
        ? snapshotData['ProfileName']
        : tiktokfeed_wz8en7_data_schema.TiktokPageStruct.maybeFromMap(
            snapshotData['ProfileName']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reels');

  static Stream<ReelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReelsRecord.fromSnapshot(s));

  static Future<ReelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReelsRecord.fromSnapshot(s));

  static ReelsRecord fromSnapshot(DocumentSnapshot snapshot) => ReelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReelsRecordData({
  int? tags,
  int? moderationStatus,
  DateTime? createdAt,
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? fileName,
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? urlVideo,
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? assetTypeFirebase,
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? publicId,
  String? deliveryType,
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? assetId,
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? format,
  tiktokfeed_wz8en7_data_schema.TiktokPageStruct? profileName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tags': tags,
      'moderationStatus': moderationStatus,
      'createdAt': createdAt,
      'fileName': tiktokfeed_wz8en7_data_schema.TiktokPageStruct().toMap(),
      'urlVideo': tiktokfeed_wz8en7_data_schema.TiktokPageStruct().toMap(),
      'assetTypeFirebase':
          tiktokfeed_wz8en7_data_schema.TiktokPageStruct().toMap(),
      'publicId': tiktokfeed_wz8en7_data_schema.TiktokPageStruct().toMap(),
      'deliveryType': deliveryType,
      'assetId': tiktokfeed_wz8en7_data_schema.TiktokPageStruct().toMap(),
      'format': tiktokfeed_wz8en7_data_schema.TiktokPageStruct().toMap(),
      'ProfileName': tiktokfeed_wz8en7_data_schema.TiktokPageStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "fileName" field.
  tiktokfeed_wz8en7_data_schema.addTiktokPageStructData(
      firestoreData, fileName, 'fileName');

  // Handle nested data for "urlVideo" field.
  tiktokfeed_wz8en7_data_schema.addTiktokPageStructData(
      firestoreData, urlVideo, 'urlVideo');

  // Handle nested data for "assetTypeFirebase" field.
  tiktokfeed_wz8en7_data_schema.addTiktokPageStructData(
      firestoreData, assetTypeFirebase, 'assetTypeFirebase');

  // Handle nested data for "publicId" field.
  tiktokfeed_wz8en7_data_schema.addTiktokPageStructData(
      firestoreData, publicId, 'publicId');

  // Handle nested data for "assetId" field.
  tiktokfeed_wz8en7_data_schema.addTiktokPageStructData(
      firestoreData, assetId, 'assetId');

  // Handle nested data for "format" field.
  tiktokfeed_wz8en7_data_schema.addTiktokPageStructData(
      firestoreData, format, 'format');

  // Handle nested data for "ProfileName" field.
  tiktokfeed_wz8en7_data_schema.addTiktokPageStructData(
      firestoreData, profileName, 'ProfileName');

  return firestoreData;
}

class ReelsRecordDocumentEquality implements Equality<ReelsRecord> {
  const ReelsRecordDocumentEquality();

  @override
  bool equals(ReelsRecord? e1, ReelsRecord? e2) {
    return e1?.tags == e2?.tags &&
        e1?.moderationStatus == e2?.moderationStatus &&
        e1?.createdAt == e2?.createdAt &&
        e1?.fileName == e2?.fileName &&
        e1?.urlVideo == e2?.urlVideo &&
        e1?.assetTypeFirebase == e2?.assetTypeFirebase &&
        e1?.publicId == e2?.publicId &&
        e1?.deliveryType == e2?.deliveryType &&
        e1?.assetId == e2?.assetId &&
        e1?.format == e2?.format &&
        e1?.profileName == e2?.profileName;
  }

  @override
  int hash(ReelsRecord? e) => const ListEquality().hash([
        e?.tags,
        e?.moderationStatus,
        e?.createdAt,
        e?.fileName,
        e?.urlVideo,
        e?.assetTypeFirebase,
        e?.publicId,
        e?.deliveryType,
        e?.assetId,
        e?.format,
        e?.profileName
      ]);

  @override
  bool isValidKey(Object? o) => o is ReelsRecord;
}
