import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductMasterRecord extends FirestoreRecord {
  ProductMasterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "SQL_id" field.
  int? _sQLId;
  int get sQLId => _sQLId ?? 0;
  bool hasSQLId() => _sQLId != null;

  // "item_master" field.
  String? _itemMaster;
  String get itemMaster => _itemMaster ?? '';
  bool hasItemMaster() => _itemMaster != null;

  // "bid" field.
  int? _bid;
  int get bid => _bid ?? 0;
  bool hasBid() => _bid != null;

  // "cid" field.
  int? _cid;
  int get cid => _cid ?? 0;
  bool hasCid() => _cid != null;

  // "mrp" field.
  double? _mrp;
  double get mrp => _mrp ?? 0.0;
  bool hasMrp() => _mrp != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  // "disc" field.
  double? _disc;
  double get disc => _disc ?? 0.0;
  bool hasDisc() => _disc != null;

  // "Adding_Time" field.
  DateTime? _addingTime;
  DateTime? get addingTime => _addingTime;
  bool hasAddingTime() => _addingTime != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "PhotoOnList" field.
  String? _photoOnList;
  String get photoOnList => _photoOnList ?? '';
  bool hasPhotoOnList() => _photoOnList != null;

  // "Catagorey_name" field.
  String? _catagoreyName;
  String get catagoreyName => _catagoreyName ?? '';
  bool hasCatagoreyName() => _catagoreyName != null;

  // "Is_HomePage" field.
  bool? _isHomePage;
  bool get isHomePage => _isHomePage ?? false;
  bool hasIsHomePage() => _isHomePage != null;

  // "User_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "favourate_time" field.
  DateTime? _favourateTime;
  DateTime? get favourateTime => _favourateTime;
  bool hasFavourateTime() => _favourateTime != null;

  // "favourite" field.
  List<DocumentReference>? _favourite;
  List<DocumentReference> get favourite => _favourite ?? const [];
  bool hasFavourite() => _favourite != null;

  void _initializeFields() {
    _sQLId = castToType<int>(snapshotData['SQL_id']);
    _itemMaster = snapshotData['item_master'] as String?;
    _bid = castToType<int>(snapshotData['bid']);
    _cid = castToType<int>(snapshotData['cid']);
    _mrp = castToType<double>(snapshotData['mrp']);
    _rate = castToType<double>(snapshotData['rate']);
    _disc = castToType<double>(snapshotData['disc']);
    _addingTime = snapshotData['Adding_Time'] as DateTime?;
    _brandName = snapshotData['brand_name'] as String?;
    _photoOnList = snapshotData['PhotoOnList'] as String?;
    _catagoreyName = snapshotData['Catagorey_name'] as String?;
    _isHomePage = snapshotData['Is_HomePage'] as bool?;
    _userId = snapshotData['User_id'] as DocumentReference?;
    _favourateTime = snapshotData['favourate_time'] as DateTime?;
    _favourite = getDataList(snapshotData['favourite']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Product_Master');

  static Stream<ProductMasterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductMasterRecord.fromSnapshot(s));

  static Future<ProductMasterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductMasterRecord.fromSnapshot(s));

  static ProductMasterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductMasterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductMasterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductMasterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductMasterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductMasterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductMasterRecordData({
  int? sQLId,
  String? itemMaster,
  int? bid,
  int? cid,
  double? mrp,
  double? rate,
  double? disc,
  DateTime? addingTime,
  String? brandName,
  String? photoOnList,
  String? catagoreyName,
  bool? isHomePage,
  DocumentReference? userId,
  DateTime? favourateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SQL_id': sQLId,
      'item_master': itemMaster,
      'bid': bid,
      'cid': cid,
      'mrp': mrp,
      'rate': rate,
      'disc': disc,
      'Adding_Time': addingTime,
      'brand_name': brandName,
      'PhotoOnList': photoOnList,
      'Catagorey_name': catagoreyName,
      'Is_HomePage': isHomePage,
      'User_id': userId,
      'favourate_time': favourateTime,
    }.withoutNulls,
  );

  return firestoreData;
}
