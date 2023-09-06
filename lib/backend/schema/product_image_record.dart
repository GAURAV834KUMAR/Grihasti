import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductImageRecord extends FirestoreRecord {
  ProductImageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  bool hasId() => _id != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _id = snapshotData['id'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Product_Image');

  static Stream<ProductImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductImageRecord.fromSnapshot(s));

  static Future<ProductImageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductImageRecord.fromSnapshot(s));

  static ProductImageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductImageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductImageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductImageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductImageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductImageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductImageRecordData({
  DocumentReference? id,
  String? image,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'image': image,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}
