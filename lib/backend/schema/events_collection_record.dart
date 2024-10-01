import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsCollectionRecord extends FirestoreRecord {
  EventsCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "length" field.
  int? _length;
  int get length => _length ?? 0;
  bool hasLength() => _length != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "provider" field.
  DocumentReference? _provider;
  DocumentReference? get provider => _provider;
  bool hasProvider() => _provider != null;

  // "reviews" field.
  List<DocumentReference>? _reviews;
  List<DocumentReference> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "classID" field.
  String? _classID;
  String get classID => _classID ?? '';
  bool hasClassID() => _classID != null;

  // "classPicture" field.
  String? _classPicture;
  String get classPicture => _classPicture ?? '';
  bool hasClassPicture() => _classPicture != null;

  // "Uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _length = castToType<int>(snapshotData['length']);
    _price = castToType<double>(snapshotData['price']);
    _time = snapshotData['time'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _provider = snapshotData['provider'] as DocumentReference?;
    _reviews = getDataList(snapshotData['reviews']);
    _classID = snapshotData['classID'] as String?;
    _classPicture = snapshotData['classPicture'] as String?;
    _uid = snapshotData['Uid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EventsCollection');

  static Stream<EventsCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsCollectionRecord.fromSnapshot(s));

  static Future<EventsCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventsCollectionRecord.fromSnapshot(s));

  static EventsCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventsCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsCollectionRecordData({
  String? title,
  String? description,
  int? length,
  double? price,
  DateTime? time,
  String? location,
  DocumentReference? provider,
  String? classID,
  String? classPicture,
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'length': length,
      'price': price,
      'time': time,
      'location': location,
      'provider': provider,
      'classID': classID,
      'classPicture': classPicture,
      'Uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsCollectionRecordDocumentEquality
    implements Equality<EventsCollectionRecord> {
  const EventsCollectionRecordDocumentEquality();

  @override
  bool equals(EventsCollectionRecord? e1, EventsCollectionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.length == e2?.length &&
        e1?.price == e2?.price &&
        e1?.time == e2?.time &&
        e1?.location == e2?.location &&
        e1?.provider == e2?.provider &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        e1?.classID == e2?.classID &&
        e1?.classPicture == e2?.classPicture &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(EventsCollectionRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.length,
        e?.price,
        e?.time,
        e?.location,
        e?.provider,
        e?.reviews,
        e?.classID,
        e?.classPicture,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsCollectionRecord;
}
