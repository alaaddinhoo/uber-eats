import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrowseCategoriesRecord extends FirestoreRecord {
  BrowseCategoriesRecord._(
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

  // "topCategory" field.
  bool? _topCategory;
  bool get topCategory => _topCategory ?? false;
  bool hasTopCategory() => _topCategory != null;

  // "homepageVisible" field.
  bool? _homepageVisible;
  bool get homepageVisible => _homepageVisible ?? false;
  bool hasHomepageVisible() => _homepageVisible != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _topCategory = snapshotData['topCategory'] as bool?;
    _homepageVisible = snapshotData['homepageVisible'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('browseCategories');

  static Stream<BrowseCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BrowseCategoriesRecord.fromSnapshot(s));

  static Future<BrowseCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BrowseCategoriesRecord.fromSnapshot(s));

  static BrowseCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BrowseCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BrowseCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BrowseCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BrowseCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BrowseCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBrowseCategoriesRecordData({
  String? name,
  String? imageUrl,
  bool? topCategory,
  bool? homepageVisible,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image_url': imageUrl,
      'topCategory': topCategory,
      'homepageVisible': homepageVisible,
    }.withoutNulls,
  );

  return firestoreData;
}

class BrowseCategoriesRecordDocumentEquality
    implements Equality<BrowseCategoriesRecord> {
  const BrowseCategoriesRecordDocumentEquality();

  @override
  bool equals(BrowseCategoriesRecord? e1, BrowseCategoriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.topCategory == e2?.topCategory &&
        e1?.homepageVisible == e2?.homepageVisible;
  }

  @override
  int hash(BrowseCategoriesRecord? e) => const ListEquality()
      .hash([e?.name, e?.imageUrl, e?.topCategory, e?.homepageVisible]);

  @override
  bool isValidKey(Object? o) => o is BrowseCategoriesRecord;
}
