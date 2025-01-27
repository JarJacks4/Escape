import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryItemsRecord extends FirestoreRecord {
  HistoryItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "historyId" field.
  int? _historyId;
  int get historyId => _historyId ?? 0;
  bool hasHistoryId() => _historyId != null;

  // "data" field.
  List<ChatModelStruct>? _data;
  List<ChatModelStruct> get data => _data ?? const [];
  bool hasData() => _data != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _historyId = castToType<int>(snapshotData['historyId']);
    _data = getStructList(
      snapshotData['data'],
      ChatModelStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('historyItems')
          : FirebaseFirestore.instance.collectionGroup('historyItems');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('historyItems').doc(id);

  static Stream<HistoryItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryItemsRecord.fromSnapshot(s));

  static Future<HistoryItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryItemsRecord.fromSnapshot(s));

  static HistoryItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryItemsRecordData({
  int? historyId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'historyId': historyId,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryItemsRecordDocumentEquality
    implements Equality<HistoryItemsRecord> {
  const HistoryItemsRecordDocumentEquality();

  @override
  bool equals(HistoryItemsRecord? e1, HistoryItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.historyId == e2?.historyId &&
        listEquality.equals(e1?.data, e2?.data);
  }

  @override
  int hash(HistoryItemsRecord? e) =>
      const ListEquality().hash([e?.historyId, e?.data]);

  @override
  bool isValidKey(Object? o) => o is HistoryItemsRecord;
}
