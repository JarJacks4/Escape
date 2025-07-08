import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMoodsRecord extends FirestoreRecord {
  UserMoodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "CurrentMood" field.
  String? _currentMood;
  String get currentMood => _currentMood ?? '';
  bool hasCurrentMood() => _currentMood != null;

  // "CurrentMoodPhoto" field.
  String? _currentMoodPhoto;
  String get currentMoodPhoto => _currentMoodPhoto ?? '';
  bool hasCurrentMoodPhoto() => _currentMoodPhoto != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _currentMood = snapshotData['CurrentMood'] as String?;
    _currentMoodPhoto = snapshotData['CurrentMoodPhoto'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UserMoods');

  static Stream<UserMoodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserMoodsRecord.fromSnapshot(s));

  static Future<UserMoodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserMoodsRecord.fromSnapshot(s));

  static UserMoodsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserMoodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserMoodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserMoodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserMoodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserMoodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserMoodsRecordData({
  String? userId,
  String? currentMood,
  String? currentMoodPhoto,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'CurrentMood': currentMood,
      'CurrentMoodPhoto': currentMoodPhoto,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserMoodsRecordDocumentEquality implements Equality<UserMoodsRecord> {
  const UserMoodsRecordDocumentEquality();

  @override
  bool equals(UserMoodsRecord? e1, UserMoodsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.currentMood == e2?.currentMood &&
        e1?.currentMoodPhoto == e2?.currentMoodPhoto &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(UserMoodsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.currentMood, e?.currentMoodPhoto, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is UserMoodsRecord;
}
