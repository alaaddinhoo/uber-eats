import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "instructions" field.
  String? _instructions;
  String get instructions => _instructions ?? '';
  bool hasInstructions() => _instructions != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _item = snapshotData['item'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _instructions = snapshotData['instructions'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  DocumentReference? user,
  DocumentReference? item,
  int? quantity,
  String? instructions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'item': item,
      'quantity': quantity,
      'instructions': instructions,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.item == e2?.item &&
        e1?.quantity == e2?.quantity &&
        e1?.instructions == e2?.instructions;
  }

  @override
  int hash(CartRecord? e) => const ListEquality()
      .hash([e?.user, e?.item, e?.quantity, e?.instructions]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
