import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "videoName" field.
  String? _videoName;
  String get videoName => _videoName ?? '';
  bool hasVideoName() => _videoName != null;

  // "videoOwner" field.
  String? _videoOwner;
  String get videoOwner => _videoOwner ?? '';
  bool hasVideoOwner() => _videoOwner != null;

  // "videoDescription" field.
  String? _videoDescription;
  String get videoDescription => _videoDescription ?? '';
  bool hasVideoDescription() => _videoDescription != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "videoThumbnailImage" field.
  String? _videoThumbnailImage;
  String get videoThumbnailImage => _videoThumbnailImage ?? '';
  bool hasVideoThumbnailImage() => _videoThumbnailImage != null;

  // "videoUrlString" field.
  String? _videoUrlString;
  String get videoUrlString => _videoUrlString ?? '';
  bool hasVideoUrlString() => _videoUrlString != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _videoName = snapshotData['videoName'] as String?;
    _videoOwner = snapshotData['videoOwner'] as String?;
    _videoDescription = snapshotData['videoDescription'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _videoThumbnailImage = snapshotData['videoThumbnailImage'] as String?;
    _videoUrlString = snapshotData['videoUrlString'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Videos')
          : FirebaseFirestore.instance.collectionGroup('Videos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Videos').doc(id);

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  String? videoName,
  String? videoOwner,
  String? videoDescription,
  String? videoUrl,
  String? videoThumbnailImage,
  String? videoUrlString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'videoName': videoName,
      'videoOwner': videoOwner,
      'videoDescription': videoDescription,
      'videoUrl': videoUrl,
      'videoThumbnailImage': videoThumbnailImage,
      'videoUrlString': videoUrlString,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.videoName == e2?.videoName &&
        e1?.videoOwner == e2?.videoOwner &&
        e1?.videoDescription == e2?.videoDescription &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.videoThumbnailImage == e2?.videoThumbnailImage &&
        e1?.videoUrlString == e2?.videoUrlString;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.videoName,
        e?.videoOwner,
        e?.videoDescription,
        e?.videoUrl,
        e?.videoThumbnailImage,
        e?.videoUrlString
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
