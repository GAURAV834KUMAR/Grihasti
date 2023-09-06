import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderDetailsRecord extends FirestoreRecord {
  OrderDetailsRecord._(
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

  // "Order_Time" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "Order_Status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "Delivery_Date" field.
  DateTime? _deliveryDate;
  DateTime? get deliveryDate => _deliveryDate;
  bool hasDeliveryDate() => _deliveryDate != null;

  // "Delivery_Time" field.
  String? _deliveryTime;
  String get deliveryTime => _deliveryTime ?? '';
  bool hasDeliveryTime() => _deliveryTime != null;

  // "Is_DeliveryTime" field.
  bool? _isDeliveryTime;
  bool get isDeliveryTime => _isDeliveryTime ?? false;
  bool hasIsDeliveryTime() => _isDeliveryTime != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "Is_Delivered" field.
  bool? _isDelivered;
  bool get isDelivered => _isDelivered ?? false;
  bool hasIsDelivered() => _isDelivered != null;

  // "Delivery_Charges" field.
  double? _deliveryCharges;
  double get deliveryCharges => _deliveryCharges ?? 0.0;
  bool hasDeliveryCharges() => _deliveryCharges != null;

  // "Delivery_char_free" field.
  bool? _deliveryCharFree;
  bool get deliveryCharFree => _deliveryCharFree ?? false;
  bool hasDeliveryCharFree() => _deliveryCharFree != null;

  // "Is_Delivery_Charge" field.
  bool? _isDeliveryCharge;
  bool get isDeliveryCharge => _isDeliveryCharge ?? false;
  bool hasIsDeliveryCharge() => _isDeliveryCharge != null;

  // "Is_Order" field.
  bool? _isOrder;
  bool get isOrder => _isOrder ?? false;
  bool hasIsOrder() => _isOrder != null;

  // "No_of_items" field.
  int? _noOfItems;
  int get noOfItems => _noOfItems ?? 0;
  bool hasNoOfItems() => _noOfItems != null;

  // "Mrp" field.
  double? _mrp;
  double get mrp => _mrp ?? 0.0;
  bool hasMrp() => _mrp != null;

  void _initializeFields() {
    _userId = snapshotData['UserId'] as DocumentReference?;
    _aid = snapshotData['aid'] as DocumentReference?;
    _orderTime = snapshotData['Order_Time'] as DateTime?;
    _orderStatus = snapshotData['Order_Status'] as String?;
    _deliveryDate = snapshotData['Delivery_Date'] as DateTime?;
    _deliveryTime = snapshotData['Delivery_Time'] as String?;
    _isDeliveryTime = snapshotData['Is_DeliveryTime'] as bool?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _isDelivered = snapshotData['Is_Delivered'] as bool?;
    _deliveryCharges = castToType<double>(snapshotData['Delivery_Charges']);
    _deliveryCharFree = snapshotData['Delivery_char_free'] as bool?;
    _isDeliveryCharge = snapshotData['Is_Delivery_Charge'] as bool?;
    _isOrder = snapshotData['Is_Order'] as bool?;
    _noOfItems = castToType<int>(snapshotData['No_of_items']);
    _mrp = castToType<double>(snapshotData['Mrp']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Order_details');

  static Stream<OrderDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderDetailsRecord.fromSnapshot(s));

  static Future<OrderDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderDetailsRecord.fromSnapshot(s));

  static OrderDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderDetailsRecordData({
  DocumentReference? userId,
  DocumentReference? aid,
  DateTime? orderTime,
  String? orderStatus,
  DateTime? deliveryDate,
  String? deliveryTime,
  bool? isDeliveryTime,
  double? subtotal,
  bool? isDelivered,
  double? deliveryCharges,
  bool? deliveryCharFree,
  bool? isDeliveryCharge,
  bool? isOrder,
  int? noOfItems,
  double? mrp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserId': userId,
      'aid': aid,
      'Order_Time': orderTime,
      'Order_Status': orderStatus,
      'Delivery_Date': deliveryDate,
      'Delivery_Time': deliveryTime,
      'Is_DeliveryTime': isDeliveryTime,
      'subtotal': subtotal,
      'Is_Delivered': isDelivered,
      'Delivery_Charges': deliveryCharges,
      'Delivery_char_free': deliveryCharFree,
      'Is_Delivery_Charge': isDeliveryCharge,
      'Is_Order': isOrder,
      'No_of_items': noOfItems,
      'Mrp': mrp,
    }.withoutNulls,
  );

  return firestoreData;
}
