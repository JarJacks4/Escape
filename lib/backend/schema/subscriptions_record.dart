import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "subscriptionId" field.
  String? _subscriptionId;
  String get subscriptionId => _subscriptionId ?? '';
  bool hasSubscriptionId() => _subscriptionId != null;

  // "subscriptionStatus" field.
  String? _subscriptionStatus;
  String get subscriptionStatus => _subscriptionStatus ?? '';
  bool hasSubscriptionStatus() => _subscriptionStatus != null;

  // "premiumFeatures" field.
  bool? _premiumFeatures;
  bool get premiumFeatures => _premiumFeatures ?? false;
  bool hasPremiumFeatures() => _premiumFeatures != null;

  // "subscriptionBadge" field.
  bool? _subscriptionBadge;
  bool get subscriptionBadge => _subscriptionBadge ?? false;
  bool hasSubscriptionBadge() => _subscriptionBadge != null;

  // "IsSubscriber" field.
  bool? _isSubscriber;
  bool get isSubscriber => _isSubscriber ?? false;
  bool hasIsSubscriber() => _isSubscriber != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _subscriptionId = snapshotData['subscriptionId'] as String?;
    _subscriptionStatus = snapshotData['subscriptionStatus'] as String?;
    _premiumFeatures = snapshotData['premiumFeatures'] as bool?;
    _subscriptionBadge = snapshotData['subscriptionBadge'] as bool?;
    _isSubscriber = snapshotData['IsSubscriber'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Subscriptions')
          : FirebaseFirestore.instance.collectionGroup('Subscriptions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Subscriptions').doc(id);

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  String? subscriptionId,
  String? subscriptionStatus,
  bool? premiumFeatures,
  bool? subscriptionBadge,
  bool? isSubscriber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subscriptionId': subscriptionId,
      'subscriptionStatus': subscriptionStatus,
      'premiumFeatures': premiumFeatures,
      'subscriptionBadge': subscriptionBadge,
      'IsSubscriber': isSubscriber,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    return e1?.subscriptionId == e2?.subscriptionId &&
        e1?.subscriptionStatus == e2?.subscriptionStatus &&
        e1?.premiumFeatures == e2?.premiumFeatures &&
        e1?.subscriptionBadge == e2?.subscriptionBadge &&
        e1?.isSubscriber == e2?.isSubscriber;
  }

  @override
  int hash(SubscriptionsRecord? e) => const ListEquality().hash([
        e?.subscriptionId,
        e?.subscriptionStatus,
        e?.premiumFeatures,
        e?.subscriptionBadge,
        e?.isSubscriber
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}
