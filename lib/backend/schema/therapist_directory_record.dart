import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TherapistDirectoryRecord extends FirestoreRecord {
  TherapistDirectoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "TherapistName" field.
  String? _therapistName;
  String get therapistName => _therapistName ?? '';
  bool hasTherapistName() => _therapistName != null;

  // "location" field.
  List<LatLng>? _location;
  List<LatLng> get location => _location ?? const [];
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _therapistName = snapshotData['TherapistName'] as String?;
    _location = getDataList(snapshotData['location']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TherapistDirectory');

  static Stream<TherapistDirectoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TherapistDirectoryRecord.fromSnapshot(s));

  static Future<TherapistDirectoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TherapistDirectoryRecord.fromSnapshot(s));

  static TherapistDirectoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TherapistDirectoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TherapistDirectoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TherapistDirectoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TherapistDirectoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TherapistDirectoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTherapistDirectoryRecordData({
  String? therapistName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TherapistName': therapistName,
    }.withoutNulls,
  );

  return firestoreData;
}

class TherapistDirectoryRecordDocumentEquality
    implements Equality<TherapistDirectoryRecord> {
  const TherapistDirectoryRecordDocumentEquality();

  @override
  bool equals(TherapistDirectoryRecord? e1, TherapistDirectoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.therapistName == e2?.therapistName &&
        listEquality.equals(e1?.location, e2?.location);
  }

  @override
  int hash(TherapistDirectoryRecord? e) =>
      const ListEquality().hash([e?.therapistName, e?.location]);

  @override
  bool isValidKey(Object? o) => o is TherapistDirectoryRecord;
}
