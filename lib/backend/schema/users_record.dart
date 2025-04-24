import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;

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

  // "favoriteTimeToMeditate" field.
  DateTime? _favoriteTimeToMeditate;
  DateTime? get favoriteTimeToMeditate => _favoriteTimeToMeditate;
  bool hasFavoriteTimeToMeditate() => _favoriteTimeToMeditate != null;

  // "isSubscriber" field.
  DocumentReference? _isSubscriber;
  DocumentReference? get isSubscriber => _isSubscriber;
  bool hasIsSubscriber() => _isSubscriber != null;

  // "isSubscribed" field.
  bool? _isSubscribed;
  bool get isSubscribed => _isSubscribed ?? false;
  bool hasIsSubscribed() => _isSubscribed != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "RoleChat" field.
  String? _roleChat;
  String get roleChat => _roleChat ?? '';
  bool hasRoleChat() => _roleChat != null;

  // "isHome" field.
  bool? _isHome;
  bool get isHome => _isHome ?? false;
  bool hasIsHome() => _isHome != null;

  // "isAISoundscape" field.
  bool? _isAISoundscape;
  bool get isAISoundscape => _isAISoundscape ?? false;
  bool hasIsAISoundscape() => _isAISoundscape != null;

  // "isLucilleHome" field.
  bool? _isLucilleHome;
  bool get isLucilleHome => _isLucilleHome ?? false;
  bool hasIsLucilleHome() => _isLucilleHome != null;

  // "isProvidersCommunity" field.
  bool? _isProvidersCommunity;
  bool get isProvidersCommunity => _isProvidersCommunity ?? false;
  bool hasIsProvidersCommunity() => _isProvidersCommunity != null;

  // "isProfile" field.
  bool? _isProfile;
  bool get isProfile => _isProfile ?? false;
  bool hasIsProfile() => _isProfile != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

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
    _favoriteTimeToMeditate =
        snapshotData['favoriteTimeToMeditate'] as DateTime?;
    _isSubscriber = snapshotData['isSubscriber'] as DocumentReference?;
    _isSubscribed = snapshotData['isSubscribed'] as bool?;
    _title = snapshotData['Title'] as String?;
    _roleChat = snapshotData['RoleChat'] as String?;
    _isHome = snapshotData['isHome'] as bool?;
    _isAISoundscape = snapshotData['isAISoundscape'] as bool?;
    _isLucilleHome = snapshotData['isLucilleHome'] as bool?;
    _isProvidersCommunity = snapshotData['isProvidersCommunity'] as bool?;
    _isProfile = snapshotData['isProfile'] as bool?;
    _location = snapshotData['location'] as LatLng?;
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
  DateTime? favoriteTimeToMeditate,
  DocumentReference? isSubscriber,
  bool? isSubscribed,
  String? title,
  String? roleChat,
  bool? isHome,
  bool? isAISoundscape,
  bool? isLucilleHome,
  bool? isProvidersCommunity,
  bool? isProfile,
  LatLng? location,
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
      'favoriteTimeToMeditate': favoriteTimeToMeditate,
      'isSubscriber': isSubscriber,
      'isSubscribed': isSubscribed,
      'Title': title,
      'RoleChat': roleChat,
      'isHome': isHome,
      'isAISoundscape': isAISoundscape,
      'isLucilleHome': isLucilleHome,
      'isProvidersCommunity': isProvidersCommunity,
      'isProfile': isProfile,
      'location': location,
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
        e1?.favoriteTimeToMeditate == e2?.favoriteTimeToMeditate &&
        e1?.isSubscriber == e2?.isSubscriber &&
        e1?.isSubscribed == e2?.isSubscribed &&
        e1?.title == e2?.title &&
        e1?.roleChat == e2?.roleChat &&
        e1?.isHome == e2?.isHome &&
        e1?.isAISoundscape == e2?.isAISoundscape &&
        e1?.isLucilleHome == e2?.isLucilleHome &&
        e1?.isProvidersCommunity == e2?.isProvidersCommunity &&
        e1?.isProfile == e2?.isProfile &&
        e1?.location == e2?.location;
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
        e?.favoriteTimeToMeditate,
        e?.isSubscriber,
        e?.isSubscribed,
        e?.title,
        e?.roleChat,
        e?.isHome,
        e?.isAISoundscape,
        e?.isLucilleHome,
        e?.isProvidersCommunity,
        e?.isProfile,
        e?.location
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
