import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  // "restaurant_id" field.
  DocumentReference? _restaurantId;
  DocumentReference? get restaurantId => _restaurantId;
  bool hasRestaurantId() => _restaurantId != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _ingredients = snapshotData['ingredients'] as String?;
    _restaurantId = snapshotData['restaurant_id'] as DocumentReference?;
    _price = castToType<int>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? name,
  String? imageUrl,
  String? ingredients,
  DocumentReference? restaurantId,
  int? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image_url': imageUrl,
      'ingredients': ingredients,
      'restaurant_id': restaurantId,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.ingredients == e2?.ingredients &&
        e1?.restaurantId == e2?.restaurantId &&
        e1?.price == e2?.price;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality()
      .hash([e?.name, e?.imageUrl, e?.ingredients, e?.restaurantId, e?.price]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
