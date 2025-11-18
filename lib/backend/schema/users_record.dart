import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


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

  // "hasSeenWalkthrough" field.
  bool? _hasSeenWalkthrough;
  bool get hasSeenWalkthrough => _hasSeenWalkthrough ?? false;
  bool hasHasSeenWalkthrough() => _hasSeenWalkthrough != null;

  // "hasGainedPoints" field.
  bool? _hasGainedPoints;
  bool get hasGainedPoints => _hasGainedPoints ?? false;
  bool hasHasGainedPoints() => _hasGainedPoints != null;

  // "numberOfGoalsCompleted" field.
  int? _numberOfGoalsCompleted;
  int get numberOfGoalsCompleted => _numberOfGoalsCompleted ?? 0;
  bool hasNumberOfGoalsCompleted() => _numberOfGoalsCompleted != null;

  // "ChatProfileUsername" field.
  UserProfileStruct? _chatProfileUsername;
  UserProfileStruct get chatProfileUsername =>
      _chatProfileUsername ?? UserProfileStruct();
  bool hasChatProfileUsername() => _chatProfileUsername != null;

  // "ChatProfilePicture" field.
  DocumentReference? _chatProfilePicture;
  DocumentReference? get chatProfilePicture => _chatProfilePicture;
  bool hasChatProfilePicture() => _chatProfilePicture != null;

  // "CurrentMood" field.
  String? _currentMood;
  String get currentMood => _currentMood ?? '';
  bool hasCurrentMood() => _currentMood != null;

  // "CurrentMoodPhoto" field.
  String? _currentMoodPhoto;
  String get currentMoodPhoto => _currentMoodPhoto ?? '';
  bool hasCurrentMoodPhoto() => _currentMoodPhoto != null;

  // "Notifications" field.
  String? _notifications;
  String get notifications => _notifications ?? '';
  bool hasNotifications() => _notifications != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "moodHistory" field.
  DocumentReference? _moodHistory;
  DocumentReference? get moodHistory => _moodHistory;
  bool hasMoodHistory() => _moodHistory != null;

  // "CurrentMoodDesc" field.
  String? _currentMoodDesc;
  String get currentMoodDesc => _currentMoodDesc ?? '';
  bool hasCurrentMoodDesc() => _currentMoodDesc != null;

  // "notificationsAllowed" field.
  bool? _notificationsAllowed;
  bool get notificationsAllowed => _notificationsAllowed ?? false;
  bool hasNotificationsAllowed() => _notificationsAllowed != null;

  // "isLoggedOut" field.
  bool? _isLoggedOut;
  bool get isLoggedOut => _isLoggedOut ?? false;
  bool hasIsLoggedOut() => _isLoggedOut != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "LowerChakraMood" field.
  String? _lowerChakraMood;
  String get lowerChakraMood => _lowerChakraMood ?? '';
  bool hasLowerChakraMood() => _lowerChakraMood != null;

  // "MiddleChakraMood" field.
  String? _middleChakraMood;
  String get middleChakraMood => _middleChakraMood ?? '';
  bool hasMiddleChakraMood() => _middleChakraMood != null;

  // "HigherChakraMood" field.
  String? _higherChakraMood;
  String get higherChakraMood => _higherChakraMood ?? '';
  bool hasHigherChakraMood() => _higherChakraMood != null;

  // "AscendedMood" field.
  String? _ascendedMood;
  String get ascendedMood => _ascendedMood ?? '';
  bool hasAscendedMood() => _ascendedMood != null;

  // "isRecording" field.
  bool? _isRecording;
  bool get isRecording => _isRecording ?? false;
  bool hasIsRecording() => _isRecording != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
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
    _hasSeenWalkthrough = snapshotData['hasSeenWalkthrough'] as bool?;
    _hasGainedPoints = snapshotData['hasGainedPoints'] as bool?;
    _numberOfGoalsCompleted =
        castToType<int>(snapshotData['numberOfGoalsCompleted']);
    _chatProfileUsername = snapshotData['ChatProfileUsername']
            is UserProfileStruct
        ? snapshotData['ChatProfileUsername']
        : UserProfileStruct.maybeFromMap(snapshotData['ChatProfileUsername']);
    _chatProfilePicture =
        snapshotData['ChatProfilePicture'] as DocumentReference?;
    _currentMood = snapshotData['CurrentMood'] as String?;
    _currentMoodPhoto = snapshotData['CurrentMoodPhoto'] as String?;
    _notifications = snapshotData['Notifications'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _moodHistory = snapshotData['moodHistory'] as DocumentReference?;
    _currentMoodDesc = snapshotData['CurrentMoodDesc'] as String?;
    _notificationsAllowed = snapshotData['notificationsAllowed'] as bool?;
    _isLoggedOut = snapshotData['isLoggedOut'] as bool?;
    _isActive = snapshotData['isActive'] as bool?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _lowerChakraMood = snapshotData['LowerChakraMood'] as String?;
    _middleChakraMood = snapshotData['MiddleChakraMood'] as String?;
    _higherChakraMood = snapshotData['HigherChakraMood'] as String?;
    _ascendedMood = snapshotData['AscendedMood'] as String?;
    _isRecording = snapshotData['isRecording'] as bool?;
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
  bool? hasSeenWalkthrough,
  bool? hasGainedPoints,
  int? numberOfGoalsCompleted,
  UserProfileStruct? chatProfileUsername,
  DocumentReference? chatProfilePicture,
  String? currentMood,
  String? currentMoodPhoto,
  String? notifications,
  DateTime? timeStamp,
  DocumentReference? moodHistory,
  String? currentMoodDesc,
  bool? notificationsAllowed,
  bool? isLoggedOut,
  bool? isActive,
  DocumentReference? createdBy,
  String? lowerChakraMood,
  String? middleChakraMood,
  String? higherChakraMood,
  String? ascendedMood,
  bool? isRecording,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
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
      'hasSeenWalkthrough': hasSeenWalkthrough,
      'hasGainedPoints': hasGainedPoints,
      'numberOfGoalsCompleted': numberOfGoalsCompleted,
      'ChatProfileUsername': UserProfileStruct().toMap(),
      'ChatProfilePicture': chatProfilePicture,
      'CurrentMood': currentMood,
      'CurrentMoodPhoto': currentMoodPhoto,
      'Notifications': notifications,
      'timeStamp': timeStamp,
      'moodHistory': moodHistory,
      'CurrentMoodDesc': currentMoodDesc,
      'notificationsAllowed': notificationsAllowed,
      'isLoggedOut': isLoggedOut,
      'isActive': isActive,
      'created_by': createdBy,
      'LowerChakraMood': lowerChakraMood,
      'MiddleChakraMood': middleChakraMood,
      'HigherChakraMood': higherChakraMood,
      'AscendedMood': ascendedMood,
      'isRecording': isRecording,
    }.withoutNulls,
  );

  // Handle nested data for "ChatProfileUsername" field.
  addUserProfileStructData(
      firestoreData, chatProfileUsername, 'ChatProfileUsername');

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
        e1?.location == e2?.location &&
        e1?.hasSeenWalkthrough == e2?.hasSeenWalkthrough &&
        e1?.hasGainedPoints == e2?.hasGainedPoints &&
        e1?.numberOfGoalsCompleted == e2?.numberOfGoalsCompleted &&
        e1?.chatProfileUsername == e2?.chatProfileUsername &&
        e1?.chatProfilePicture == e2?.chatProfilePicture &&
        e1?.currentMood == e2?.currentMood &&
        e1?.currentMoodPhoto == e2?.currentMoodPhoto &&
        e1?.notifications == e2?.notifications &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.moodHistory == e2?.moodHistory &&
        e1?.currentMoodDesc == e2?.currentMoodDesc &&
        e1?.notificationsAllowed == e2?.notificationsAllowed &&
        e1?.isLoggedOut == e2?.isLoggedOut &&
        e1?.isActive == e2?.isActive &&
        e1?.createdBy == e2?.createdBy &&
        e1?.lowerChakraMood == e2?.lowerChakraMood &&
        e1?.middleChakraMood == e2?.middleChakraMood &&
        e1?.higherChakraMood == e2?.higherChakraMood &&
        e1?.ascendedMood == e2?.ascendedMood &&
        e1?.isRecording == e2?.isRecording;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
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
        e?.location,
        e?.hasSeenWalkthrough,
        e?.hasGainedPoints,
        e?.numberOfGoalsCompleted,
        e?.chatProfileUsername,
        e?.chatProfilePicture,
        e?.currentMood,
        e?.currentMoodPhoto,
        e?.notifications,
        e?.timeStamp,
        e?.moodHistory,
        e?.currentMoodDesc,
        e?.notificationsAllowed,
        e?.isLoggedOut,
        e?.isActive,
        e?.createdBy,
        e?.lowerChakraMood,
        e?.middleChakraMood,
        e?.higherChakraMood,
        e?.ascendedMood,
        e?.isRecording
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
