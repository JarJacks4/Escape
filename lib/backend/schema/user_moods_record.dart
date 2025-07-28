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

  // "moodHistory" field.
  List<String>? _moodHistory;
  List<String> get moodHistory => _moodHistory ?? const [];
  bool hasMoodHistory() => _moodHistory != null;

  // "CurrentMoodDescription" field.
  String? _currentMoodDescription;
  String get currentMoodDescription => _currentMoodDescription ?? '';
  bool hasCurrentMoodDescription() => _currentMoodDescription != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _currentMood = snapshotData['CurrentMood'] as String?;
    _currentMoodPhoto = snapshotData['CurrentMoodPhoto'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _moodHistory = getDataList(snapshotData['moodHistory']);
    _currentMoodDescription = snapshotData['CurrentMoodDescription'] as String?;
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
  String? currentMoodDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'CurrentMood': currentMood,
      'CurrentMoodPhoto': currentMoodPhoto,
      'timestamp': timestamp,
      'CurrentMoodDescription': currentMoodDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserMoodsRecordDocumentEquality implements Equality<UserMoodsRecord> {
  const UserMoodsRecordDocumentEquality();

  @override
  bool equals(UserMoodsRecord? e1, UserMoodsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.currentMood == e2?.currentMood &&
        e1?.currentMoodPhoto == e2?.currentMoodPhoto &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.moodHistory, e2?.moodHistory) &&
        e1?.currentMoodDescription == e2?.currentMoodDescription;
  }

  @override
  int hash(UserMoodsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.currentMood,
        e?.currentMoodPhoto,
        e?.timestamp,
        e?.moodHistory,
        e?.currentMoodDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is UserMoodsRecord;
}
