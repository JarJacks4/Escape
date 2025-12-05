import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMoodsMainRecord extends FirestoreRecord {
  UserMoodsMainRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _currentMood = snapshotData['CurrentMood'] as String?;
    _currentMoodPhoto = snapshotData['CurrentMoodPhoto'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _moodHistory = getDataList(snapshotData['moodHistory']);
    _currentMoodDescription = snapshotData['CurrentMoodDescription'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('UserMoodsMain')
          : FirebaseFirestore.instance.collectionGroup('UserMoodsMain');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('UserMoodsMain').doc(id);

  static Stream<UserMoodsMainRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserMoodsMainRecord.fromSnapshot(s));

  static Future<UserMoodsMainRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserMoodsMainRecord.fromSnapshot(s));

  static UserMoodsMainRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserMoodsMainRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserMoodsMainRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserMoodsMainRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserMoodsMainRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserMoodsMainRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserMoodsMainRecordData({
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

class UserMoodsMainRecordDocumentEquality
    implements Equality<UserMoodsMainRecord> {
  const UserMoodsMainRecordDocumentEquality();

  @override
  bool equals(UserMoodsMainRecord? e1, UserMoodsMainRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.currentMood == e2?.currentMood &&
        e1?.currentMoodPhoto == e2?.currentMoodPhoto &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.moodHistory, e2?.moodHistory) &&
        e1?.currentMoodDescription == e2?.currentMoodDescription;
  }

  @override
  int hash(UserMoodsMainRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.currentMood,
        e?.currentMoodPhoto,
        e?.timestamp,
        e?.moodHistory,
        e?.currentMoodDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is UserMoodsMainRecord;
}
