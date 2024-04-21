import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantsRecord extends FirestoreRecord {
  RestaurantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "delivery_fee" field.
  String? _deliveryFee;
  String get deliveryFee => _deliveryFee ?? '';
  bool hasDeliveryFee() => _deliveryFee != null;

  // "delivery_time" field.
  String? _deliveryTime;
  String get deliveryTime => _deliveryTime ?? '';
  bool hasDeliveryTime() => _deliveryTime != null;

  // "cover_url" field.
  String? _coverUrl;
  String get coverUrl => _coverUrl ?? '';
  bool hasCoverUrl() => _coverUrl != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "offer" field.
  bool? _offer;
  bool get offer => _offer ?? false;
  bool hasOffer() => _offer != null;

  // "rewards" field.
  String? _rewards;
  String get rewards => _rewards ?? '';
  bool hasRewards() => _rewards != null;

  // "acceptingOrders" field.
  bool? _acceptingOrders;
  bool get acceptingOrders => _acceptingOrders ?? false;
  bool hasAcceptingOrders() => _acceptingOrders != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _deliveryFee = snapshotData['delivery_fee'] as String?;
    _deliveryTime = snapshotData['delivery_time'] as String?;
    _coverUrl = snapshotData['cover_url'] as String?;
    _category = getDataList(snapshotData['category']);
    _rating = castToType<double>(snapshotData['rating']);
    _offer = snapshotData['offer'] as bool?;
    _rewards = snapshotData['rewards'] as String?;
    _acceptingOrders = snapshotData['acceptingOrders'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantsRecord.fromSnapshot(s));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantsRecord.fromSnapshot(s));

  static RestaurantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? name,
  String? deliveryFee,
  String? deliveryTime,
  String? coverUrl,
  double? rating,
  bool? offer,
  String? rewards,
  bool? acceptingOrders,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'delivery_fee': deliveryFee,
      'delivery_time': deliveryTime,
      'cover_url': coverUrl,
      'rating': rating,
      'offer': offer,
      'rewards': rewards,
      'acceptingOrders': acceptingOrders,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantsRecordDocumentEquality implements Equality<RestaurantsRecord> {
  const RestaurantsRecordDocumentEquality();

  @override
  bool equals(RestaurantsRecord? e1, RestaurantsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.deliveryFee == e2?.deliveryFee &&
        e1?.deliveryTime == e2?.deliveryTime &&
        e1?.coverUrl == e2?.coverUrl &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.rating == e2?.rating &&
        e1?.offer == e2?.offer &&
        e1?.rewards == e2?.rewards &&
        e1?.acceptingOrders == e2?.acceptingOrders;
  }

  @override
  int hash(RestaurantsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.deliveryFee,
        e?.deliveryTime,
        e?.coverUrl,
        e?.category,
        e?.rating,
        e?.offer,
        e?.rewards,
        e?.acceptingOrders
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantsRecord;
}
