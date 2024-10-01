import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "products" field.
  List<DocumentReference>? _products;
  List<DocumentReference> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  // "order_date" field.
  DateTime? _orderDate;
  DateTime? get orderDate => _orderDate;
  bool hasOrderDate() => _orderDate != null;

  // "order_status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "customer" field.
  DocumentReference? _customer;
  DocumentReference? get customer => _customer;
  bool hasCustomer() => _customer != null;

  // "providerID" field.
  String? _providerID;
  String get providerID => _providerID ?? '';
  bool hasProviderID() => _providerID != null;

  // "classID" field.
  DocumentReference? _classID;
  DocumentReference? get classID => _classID;
  bool hasClassID() => _classID != null;

  // "OrderID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  void _initializeFields() {
    _products = getDataList(snapshotData['products']);
    _orderDate = snapshotData['order_date'] as DateTime?;
    _orderStatus = snapshotData['order_status'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _customer = snapshotData['customer'] as DocumentReference?;
    _providerID = snapshotData['providerID'] as String?;
    _classID = snapshotData['classID'] as DocumentReference?;
    _orderID = snapshotData['OrderID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? orderDate,
  String? orderStatus,
  double? price,
  DocumentReference? customer,
  String? providerID,
  DocumentReference? classID,
  String? orderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order_date': orderDate,
      'order_status': orderStatus,
      'price': price,
      'customer': customer,
      'providerID': providerID,
      'classID': classID,
      'OrderID': orderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.products, e2?.products) &&
        e1?.orderDate == e2?.orderDate &&
        e1?.orderStatus == e2?.orderStatus &&
        e1?.price == e2?.price &&
        e1?.customer == e2?.customer &&
        e1?.providerID == e2?.providerID &&
        e1?.classID == e2?.classID &&
        e1?.orderID == e2?.orderID;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.products,
        e?.orderDate,
        e?.orderStatus,
        e?.price,
        e?.customer,
        e?.providerID,
        e?.classID,
        e?.orderID
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
