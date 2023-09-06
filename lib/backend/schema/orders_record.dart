import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "aid" field.
  DocumentReference? _aid;
  DocumentReference? get aid => _aid;
  bool hasAid() => _aid != null;

  // "pid" field.
  DocumentReference? _pid;
  DocumentReference? get pid => _pid;
  bool hasPid() => _pid != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "mrp" field.
  double? _mrp;
  double get mrp => _mrp ?? 0.0;
  bool hasMrp() => _mrp != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  bool hasRate() => _rate != null;

  // "Order_Time" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "PhotoOnList" field.
  String? _photoOnList;
  String get photoOnList => _photoOnList ?? '';
  bool hasPhotoOnList() => _photoOnList != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "disc" field.
  double? _disc;
  double get disc => _disc ?? 0.0;
  bool hasDisc() => _disc != null;

  // "Order_details" field.
  DocumentReference? _orderDetails;
  DocumentReference? get orderDetails => _orderDetails;
  bool hasOrderDetails() => _orderDetails != null;

  // "SQL_id" field.
  int? _sQLId;
  int get sQLId => _sQLId ?? 0;
  bool hasSQLId() => _sQLId != null;

  void _initializeFields() {
    _userId = snapshotData['UserId'] as DocumentReference?;
    _aid = snapshotData['aid'] as DocumentReference?;
    _pid = snapshotData['pid'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _itemName = snapshotData['item_name'] as String?;
    _mrp = castToType<double>(snapshotData['mrp']);
    _rate = castToType<double>(snapshotData['rate']);
    _orderTime = snapshotData['Order_Time'] as DateTime?;
    _photoOnList = snapshotData['PhotoOnList'] as String?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _disc = castToType<double>(snapshotData['disc']);
    _orderDetails = snapshotData['Order_details'] as DocumentReference?;
    _sQLId = castToType<int>(snapshotData['SQL_id']);
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
  DocumentReference? userId,
  DocumentReference? aid,
  DocumentReference? pid,
  int? quantity,
  String? itemName,
  double? mrp,
  double? rate,
  DateTime? orderTime,
  String? photoOnList,
  double? subtotal,
  double? disc,
  DocumentReference? orderDetails,
  int? sQLId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserId': userId,
      'aid': aid,
      'pid': pid,
      'quantity': quantity,
      'item_name': itemName,
      'mrp': mrp,
      'rate': rate,
      'Order_Time': orderTime,
      'PhotoOnList': photoOnList,
      'subtotal': subtotal,
      'disc': disc,
      'Order_details': orderDetails,
      'SQL_id': sQLId,
    }.withoutNulls,
  );

  return firestoreData;
}
