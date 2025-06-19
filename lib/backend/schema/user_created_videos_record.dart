import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCreatedVideosRecord extends FirestoreRecord {
  UserCreatedVideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "video_Post" field.
  String? _videoPost;
  String get videoPost => _videoPost ?? '';
  bool hasVideoPost() => _videoPost != null;

  // "videoOwner" field.
  bool? _videoOwner;
  bool get videoOwner => _videoOwner ?? false;
  bool hasVideoOwner() => _videoOwner != null;

  void _initializeFields() {
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _videoPost = snapshotData['video_Post'] as String?;
    _videoOwner = snapshotData['videoOwner'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userCreatedVideos');

  static Stream<UserCreatedVideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCreatedVideosRecord.fromSnapshot(s));

  static Future<UserCreatedVideosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserCreatedVideosRecord.fromSnapshot(s));

  static UserCreatedVideosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCreatedVideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCreatedVideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCreatedVideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCreatedVideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCreatedVideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCreatedVideosRecordData({
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  String? videoPost,
  bool? videoOwner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_title': postTitle,
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'video_Post': videoPost,
      'videoOwner': videoOwner,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCreatedVideosRecordDocumentEquality
    implements Equality<UserCreatedVideosRecord> {
  const UserCreatedVideosRecordDocumentEquality();

  @override
  bool equals(UserCreatedVideosRecord? e1, UserCreatedVideosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.videoPost == e2?.videoPost &&
        e1?.videoOwner == e2?.videoOwner;
  }

  @override
  int hash(UserCreatedVideosRecord? e) => const ListEquality().hash([
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.videoPost,
        e?.videoOwner
      ]);

  @override
  bool isValidKey(Object? o) => o is UserCreatedVideosRecord;
}
