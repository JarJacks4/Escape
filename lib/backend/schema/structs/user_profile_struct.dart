// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserProfileStruct extends FFFirebaseStruct {
  UserProfileStruct({
    DocumentReference? username,
    DocumentReference? profilePicture,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        _profilePicture = profilePicture,
        super(firestoreUtilData);

  // "username" field.
  DocumentReference? _username;
  DocumentReference? get username => _username;
  set username(DocumentReference? val) => _username = val;

  bool hasUsername() => _username != null;

  // "ProfilePicture" field.
  DocumentReference? _profilePicture;
  DocumentReference? get profilePicture => _profilePicture;
  set profilePicture(DocumentReference? val) => _profilePicture = val;

  bool hasProfilePicture() => _profilePicture != null;

  static UserProfileStruct fromMap(Map<String, dynamic> data) =>
      UserProfileStruct(
        username: data['username'] as DocumentReference?,
        profilePicture: data['ProfilePicture'] as DocumentReference?,
      );

  static UserProfileStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProfileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'ProfilePicture': _profilePicture,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.DocumentReference,
        ),
        'ProfilePicture': serializeParam(
          _profilePicture,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserProfileStruct(
        username: deserializeParam(
          data['username'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
        profilePicture: deserializeParam(
          data['ProfilePicture'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
      );

  @override
  String toString() => 'UserProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProfileStruct &&
        username == other.username &&
        profilePicture == other.profilePicture;
  }

  @override
  int get hashCode => const ListEquality().hash([username, profilePicture]);
}

UserProfileStruct createUserProfileStruct({
  DocumentReference? username,
  DocumentReference? profilePicture,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProfileStruct(
      username: username,
      profilePicture: profilePicture,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProfileStruct? updateUserProfileStruct(
  UserProfileStruct? userProfile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProfile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProfileStructData(
  Map<String, dynamic> firestoreData,
  UserProfileStruct? userProfile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProfile == null) {
    return;
  }
  if (userProfile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userProfile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProfileData =
      getUserProfileFirestoreData(userProfile, forFieldValue);
  final nestedData =
      userProfileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userProfile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProfileFirestoreData(
  UserProfileStruct? userProfile, [
  bool forFieldValue = false,
]) {
  if (userProfile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProfile.toMap());

  // Add any Firestore field values
  userProfile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProfileListFirestoreData(
  List<UserProfileStruct>? userProfiles,
) =>
    userProfiles?.map((e) => getUserProfileFirestoreData(e, true)).toList() ??
    [];
