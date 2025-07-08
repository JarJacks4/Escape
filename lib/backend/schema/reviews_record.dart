import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "Rating" field.
  String? _rating;
  String get rating => _rating ?? '';
  bool hasRating() => _rating != null;

  // "ReviewID" field.
  String? _reviewID;
  String get reviewID => _reviewID ?? '';
  bool hasReviewID() => _reviewID != null;

  // "UserID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "ProductID" field.
  DocumentReference? _productID;
  DocumentReference? get productID => _productID;
  bool hasProductID() => _productID != null;

  // "classID" field.
  DocumentReference? _classID;
  DocumentReference? get classID => _classID;
  bool hasClassID() => _classID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comments = snapshotData['Comments'] as String?;
    _rating = snapshotData['Rating'] as String?;
    _reviewID = snapshotData['ReviewID'] as String?;
    _userID = snapshotData['UserID'] as DocumentReference?;
    _productID = snapshotData['ProductID'] as DocumentReference?;
    _classID = snapshotData['classID'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Reviews')
          : FirebaseFirestore.instance.collectionGroup('Reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Reviews').doc(id);

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  String? comments,
  String? rating,
  String? reviewID,
  DocumentReference? userID,
  DocumentReference? productID,
  DocumentReference? classID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Comments': comments,
      'Rating': rating,
      'ReviewID': reviewID,
      'UserID': userID,
      'ProductID': productID,
      'classID': classID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.comments == e2?.comments &&
        e1?.rating == e2?.rating &&
        e1?.reviewID == e2?.reviewID &&
        e1?.userID == e2?.userID &&
        e1?.productID == e2?.productID &&
        e1?.classID == e2?.classID;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.comments,
        e?.rating,
        e?.reviewID,
        e?.userID,
        e?.productID,
        e?.classID
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
