import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchHistoryRecord extends FirestoreRecord {
  SearchHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _value = snapshotData['value'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('searchHistory');

  static Stream<SearchHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SearchHistoryRecord.fromSnapshot(s));

  static Future<SearchHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SearchHistoryRecord.fromSnapshot(s));

  static SearchHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SearchHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SearchHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SearchHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SearchHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SearchHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSearchHistoryRecordData({
  DocumentReference? user,
  String? value,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'value': value,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class SearchHistoryRecordDocumentEquality
    implements Equality<SearchHistoryRecord> {
  const SearchHistoryRecordDocumentEquality();

  @override
  bool equals(SearchHistoryRecord? e1, SearchHistoryRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.value == e2?.value &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(SearchHistoryRecord? e) =>
      const ListEquality().hash([e?.user, e?.value, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is SearchHistoryRecord;
}
