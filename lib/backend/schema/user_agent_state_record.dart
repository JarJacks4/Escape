import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;

import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAgentStateRecord extends FirestoreRecord {
  UserAgentStateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "uiInstructions" field.
  List<BuildShipStreamStruct>? _uiInstructions;
  List<BuildShipStreamStruct> get uiInstructions => _uiInstructions ?? const [];
  bool hasUiInstructions() => _uiInstructions != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _uiInstructions = getStructList(
      snapshotData['uiInstructions'],
      BuildShipStreamStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_agent_state');

  static Stream<UserAgentStateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAgentStateRecord.fromSnapshot(s));

  static Future<UserAgentStateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAgentStateRecord.fromSnapshot(s));

  static UserAgentStateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAgentStateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAgentStateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAgentStateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAgentStateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAgentStateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAgentStateRecordData({
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAgentStateRecordDocumentEquality
    implements Equality<UserAgentStateRecord> {
  const UserAgentStateRecordDocumentEquality();

  @override
  bool equals(UserAgentStateRecord? e1, UserAgentStateRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        listEquality.equals(e1?.uiInstructions, e2?.uiInstructions);
  }

  @override
  int hash(UserAgentStateRecord? e) =>
      const ListEquality().hash([e?.userId, e?.uiInstructions]);

  @override
  bool isValidKey(Object? o) => o is UserAgentStateRecord;
}
