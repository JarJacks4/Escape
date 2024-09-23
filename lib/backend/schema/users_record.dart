import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "Role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "freeUser" field.
  bool? _freeUser;
  bool get freeUser => _freeUser ?? false;
  bool hasFreeUser() => _freeUser != null;

  // "isSubscriber" field.
  bool? _isSubscriber;
  bool get isSubscriber => _isSubscriber ?? false;
  bool hasIsSubscriber() => _isSubscriber != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "dateOfBirth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "FavoriteTimeToMeditate" field.
  DateTime? _favoriteTimeToMeditate;
  DateTime? get favoriteTimeToMeditate => _favoriteTimeToMeditate;
  bool hasFavoriteTimeToMeditate() => _favoriteTimeToMeditate != null;

  // "uploadedMusicFiles" field.
  String? _uploadedMusicFiles;
  String get uploadedMusicFiles => _uploadedMusicFiles ?? '';
  bool hasUploadedMusicFiles() => _uploadedMusicFiles != null;

  // "uploadedVideoFiles" field.
  DocumentReference? _uploadedVideoFiles;
  DocumentReference? get uploadedVideoFiles => _uploadedVideoFiles;
  bool hasUploadedVideoFiles() => _uploadedVideoFiles != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userName = snapshotData['UserName'] as String?;
    _role = snapshotData['Role'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _freeUser = snapshotData['freeUser'] as bool?;
    _isSubscriber = snapshotData['isSubscriber'] as bool?;
    _gender = snapshotData['gender'] as String?;
    _dateOfBirth = snapshotData['dateOfBirth'] as DateTime?;
    _favoriteTimeToMeditate =
        snapshotData['FavoriteTimeToMeditate'] as DateTime?;
    _uploadedMusicFiles = snapshotData['uploadedMusicFiles'] as String?;
    _uploadedVideoFiles =
        snapshotData['uploadedVideoFiles'] as DocumentReference?;
    _password = snapshotData['password'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? userName,
  String? role,
  String? displayName,
  String? phoneNumber,
  bool? freeUser,
  bool? isSubscriber,
  String? gender,
  DateTime? dateOfBirth,
  DateTime? favoriteTimeToMeditate,
  String? uploadedMusicFiles,
  DocumentReference? uploadedVideoFiles,
  String? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'UserName': userName,
      'Role': role,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'freeUser': freeUser,
      'isSubscriber': isSubscriber,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'FavoriteTimeToMeditate': favoriteTimeToMeditate,
      'uploadedMusicFiles': uploadedMusicFiles,
      'uploadedVideoFiles': uploadedVideoFiles,
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.userName == e2?.userName &&
        e1?.role == e2?.role &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.freeUser == e2?.freeUser &&
        e1?.isSubscriber == e2?.isSubscriber &&
        e1?.gender == e2?.gender &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.favoriteTimeToMeditate == e2?.favoriteTimeToMeditate &&
        e1?.uploadedMusicFiles == e2?.uploadedMusicFiles &&
        e1?.uploadedVideoFiles == e2?.uploadedVideoFiles &&
        e1?.password == e2?.password;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.userName,
        e?.role,
        e?.displayName,
        e?.phoneNumber,
        e?.freeUser,
        e?.isSubscriber,
        e?.gender,
        e?.dateOfBirth,
        e?.favoriteTimeToMeditate,
        e?.uploadedMusicFiles,
        e?.uploadedVideoFiles,
        e?.password
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
