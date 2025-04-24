import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassesRecord extends FirestoreRecord {
  ClassesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "ProfilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  DocumentReference get parentReference => reference.parent.parent!;

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
    _profilePicture = snapshotData['ProfilePicture'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Classes')
          : FirebaseFirestore.instance.collectionGroup('Classes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Classes').doc(id);

  static Stream<ClassesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassesRecord.fromSnapshot(s));

  static Future<ClassesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClassesRecord.fromSnapshot(s));

  static ClassesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassesRecordData({
  String? title,
  String? description,
  int? length,
  double? price,
  DateTime? time,
  String? location,
  DocumentReference? provider,
  String? classID,
  String? profilePicture,
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
      'ProfilePicture': profilePicture,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClassesRecordDocumentEquality implements Equality<ClassesRecord> {
  const ClassesRecordDocumentEquality();

  @override
  bool equals(ClassesRecord? e1, ClassesRecord? e2) {
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
        e1?.profilePicture == e2?.profilePicture;
  }

  @override
  int hash(ClassesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.length,
        e?.price,
        e?.time,
        e?.location,
        e?.provider,
        e?.reviews,
        e?.classID,
        e?.profilePicture
      ]);

  @override
  bool isValidKey(Object? o) => o is ClassesRecord;
}
