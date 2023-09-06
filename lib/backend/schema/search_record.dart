import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchRecord extends FirestoreRecord {
  SearchRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  bool hasId() => _id != null;

  // "search_time" field.
  DateTime? _searchTime;
  DateTime? get searchTime => _searchTime;
  bool hasSearchTime() => _searchTime != null;

  // "search" field.
  String? _search;
  String get search => _search ?? '';
  bool hasSearch() => _search != null;

  void _initializeFields() {
    _id = snapshotData['id'] as DocumentReference?;
    _searchTime = snapshotData['search_time'] as DateTime?;
    _search = snapshotData['search'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('search');

  static Stream<SearchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SearchRecord.fromSnapshot(s));

  static Future<SearchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SearchRecord.fromSnapshot(s));

  static SearchRecord fromSnapshot(DocumentSnapshot snapshot) => SearchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SearchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SearchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SearchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SearchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSearchRecordData({
  DocumentReference? id,
  DateTime? searchTime,
  String? search,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'search_time': searchTime,
      'search': search,
    }.withoutNulls,
  );

  return firestoreData;
}
