import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationRecord extends FirestoreRecord {
  LocationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  bool hasZip() => _zip != null;

  // "TherapistName" field.
  DocumentReference? _therapistName;
  DocumentReference? get therapistName => _therapistName;
  bool hasTherapistName() => _therapistName != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _zip = snapshotData['zip'] as String?;
    _therapistName = snapshotData['TherapistName'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('location')
          : FirebaseFirestore.instance.collectionGroup('location');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('location').doc(id);

  static Stream<LocationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationRecord.fromSnapshot(s));

  static Future<LocationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationRecord.fromSnapshot(s));

  static LocationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationRecordData({
  String? city,
  String? state,
  String? zip,
  DocumentReference? therapistName,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'state': state,
      'zip': zip,
      'TherapistName': therapistName,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationRecordDocumentEquality implements Equality<LocationRecord> {
  const LocationRecordDocumentEquality();

  @override
  bool equals(LocationRecord? e1, LocationRecord? e2) {
    return e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.zip == e2?.zip &&
        e1?.therapistName == e2?.therapistName &&
        e1?.location == e2?.location;
  }

  @override
  int hash(LocationRecord? e) => const ListEquality()
      .hash([e?.city, e?.state, e?.zip, e?.therapistName, e?.location]);

  @override
  bool isValidKey(Object? o) => o is LocationRecord;
}
