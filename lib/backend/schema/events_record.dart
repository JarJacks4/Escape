import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "docID" field.
  String? _docID;
  String get docID => _docID ?? '';
  bool hasDocID() => _docID != null;

  // "eventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "eventDescription" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "eventDate" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "eventLocation" field.
  LatLng? _eventLocation;
  LatLng? get eventLocation => _eventLocation;
  bool hasEventLocation() => _eventLocation != null;

  // "eventLocationName" field.
  String? _eventLocationName;
  String get eventLocationName => _eventLocationName ?? '';
  bool hasEventLocationName() => _eventLocationName != null;

  // "eventCategory" field.
  String? _eventCategory;
  String get eventCategory => _eventCategory ?? '';
  bool hasEventCategory() => _eventCategory != null;

  // "eventImage" field.
  String? _eventImage;
  String get eventImage => _eventImage ?? '';
  bool hasEventImage() => _eventImage != null;

  // "organizerID" field.
  String? _organizerID;
  String get organizerID => _organizerID ?? '';
  bool hasOrganizerID() => _organizerID != null;

  // "participants" field.
  List<String>? _participants;
  List<String> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _docID = snapshotData['docID'] as String?;
    _eventName = snapshotData['eventName'] as String?;
    _eventDescription = snapshotData['eventDescription'] as String?;
    _eventDate = snapshotData['eventDate'] as DateTime?;
    _eventLocation = snapshotData['eventLocation'] as LatLng?;
    _eventLocationName = snapshotData['eventLocationName'] as String?;
    _eventCategory = snapshotData['eventCategory'] as String?;
    _eventImage = snapshotData['eventImage'] as String?;
    _organizerID = snapshotData['organizerID'] as String?;
    _participants = getDataList(snapshotData['participants']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Events')
          : FirebaseFirestore.instance.collectionGroup('Events');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Events').doc(id);

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? docID,
  String? eventName,
  String? eventDescription,
  DateTime? eventDate,
  LatLng? eventLocation,
  String? eventLocationName,
  String? eventCategory,
  String? eventImage,
  String? organizerID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'docID': docID,
      'eventName': eventName,
      'eventDescription': eventDescription,
      'eventDate': eventDate,
      'eventLocation': eventLocation,
      'eventLocationName': eventLocationName,
      'eventCategory': eventCategory,
      'eventImage': eventImage,
      'organizerID': organizerID,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.docID == e2?.docID &&
        e1?.eventName == e2?.eventName &&
        e1?.eventDescription == e2?.eventDescription &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventLocation == e2?.eventLocation &&
        e1?.eventLocationName == e2?.eventLocationName &&
        e1?.eventCategory == e2?.eventCategory &&
        e1?.eventImage == e2?.eventImage &&
        e1?.organizerID == e2?.organizerID &&
        listEquality.equals(e1?.participants, e2?.participants);
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.docID,
        e?.eventName,
        e?.eventDescription,
        e?.eventDate,
        e?.eventLocation,
        e?.eventLocationName,
        e?.eventCategory,
        e?.eventImage,
        e?.organizerID,
        e?.participants
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
