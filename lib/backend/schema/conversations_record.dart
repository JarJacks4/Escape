import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationsRecord extends FirestoreRecord {
  ConversationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "timeEdited" field.
  DateTime? _timeEdited;
  DateTime? get timeEdited => _timeEdited;
  bool hasTimeEdited() => _timeEdited != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "conversation" field.
  List<MessageStruct>? _conversation;
  List<MessageStruct> get conversation => _conversation ?? const [];
  bool hasConversation() => _conversation != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _timeCreated = snapshotData['timeCreated'] as DateTime?;
    _timeEdited = snapshotData['timeEdited'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _conversation = getStructList(
      snapshotData['conversation'],
      MessageStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Conversations');

  static Stream<ConversationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConversationsRecord.fromSnapshot(s));

  static Future<ConversationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConversationsRecord.fromSnapshot(s));

  static ConversationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConversationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConversationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConversationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConversationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConversationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConversationsRecordData({
  DocumentReference? userRef,
  DateTime? timeCreated,
  DateTime? timeEdited,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'timeCreated': timeCreated,
      'timeEdited': timeEdited,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConversationsRecordDocumentEquality
    implements Equality<ConversationsRecord> {
  const ConversationsRecordDocumentEquality();

  @override
  bool equals(ConversationsRecord? e1, ConversationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.timeEdited == e2?.timeEdited &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.conversation, e2?.conversation);
  }

  @override
  int hash(ConversationsRecord? e) => const ListEquality().hash(
      [e?.userRef, e?.timeCreated, e?.timeEdited, e?.name, e?.conversation]);

  @override
  bool isValidKey(Object? o) => o is ConversationsRecord;
}
