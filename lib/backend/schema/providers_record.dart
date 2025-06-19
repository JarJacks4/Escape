import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProvidersRecord extends FirestoreRecord {
  ProvidersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "providerID" field.
  String? _providerID;
  String get providerID => _providerID ?? '';
  bool hasProviderID() => _providerID != null;

  // "profilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "Services" field.
  List<String>? _services;
  List<String> get services => _services ?? const [];
  bool hasServices() => _services != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _providerID = snapshotData['providerID'] as String?;
    _profilePicture = snapshotData['profilePicture'] as String?;
    _services = getDataList(snapshotData['Services']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Providers');

  static Stream<ProvidersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProvidersRecord.fromSnapshot(s));

  static Future<ProvidersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProvidersRecord.fromSnapshot(s));

  static ProvidersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProvidersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProvidersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProvidersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProvidersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProvidersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProvidersRecordData({
  String? email,
  DateTime? createdTime,
  String? bio,
  String? userName,
  String? providerID,
  String? profilePicture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'bio': bio,
      'user_name': userName,
      'providerID': providerID,
      'profilePicture': profilePicture,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProvidersRecordDocumentEquality implements Equality<ProvidersRecord> {
  const ProvidersRecordDocumentEquality();

  @override
  bool equals(ProvidersRecord? e1, ProvidersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        e1?.providerID == e2?.providerID &&
        e1?.profilePicture == e2?.profilePicture &&
        listEquality.equals(e1?.services, e2?.services);
  }

  @override
  int hash(ProvidersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.createdTime,
        e?.bio,
        e?.userName,
        e?.providerID,
        e?.profilePicture,
        e?.services
      ]);

  @override
  bool isValidKey(Object? o) => o is ProvidersRecord;
}
