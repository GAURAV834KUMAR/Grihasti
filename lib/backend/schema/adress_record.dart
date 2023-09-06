import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdressRecord extends FirestoreRecord {
  AdressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Phone_no" field.
  String? _phoneNo;
  String get phoneNo => _phoneNo ?? '';
  bool hasPhoneNo() => _phoneNo != null;

  // "PIN_Code" field.
  int? _pINCode;
  int get pINCode => _pINCode ?? 0;
  bool hasPINCode() => _pINCode != null;

  // "Area" field.
  String? _area;
  String get area => _area ?? '';
  bool hasArea() => _area != null;

  // "Landmark" field.
  String? _landmark;
  String get landmark => _landmark ?? '';
  bool hasLandmark() => _landmark != null;

  // "Town_CityName" field.
  String? _townCityName;
  String get townCityName => _townCityName ?? '';
  bool hasTownCityName() => _townCityName != null;

  // "District" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "aid" field.
  String? _aid;
  String get aid => _aid ?? '';
  bool hasAid() => _aid != null;

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "Adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "Address_Type" field.
  String? _addressType;
  String get addressType => _addressType ?? '';
  bool hasAddressType() => _addressType != null;

  // "Default_Add" field.
  bool? _defaultAdd;
  bool get defaultAdd => _defaultAdd ?? false;
  bool hasDefaultAdd() => _defaultAdd != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _phoneNo = snapshotData['Phone_no'] as String?;
    _pINCode = castToType<int>(snapshotData['PIN_Code']);
    _area = snapshotData['Area'] as String?;
    _landmark = snapshotData['Landmark'] as String?;
    _townCityName = snapshotData['Town_CityName'] as String?;
    _district = snapshotData['District'] as String?;
    _state = snapshotData['State'] as String?;
    _country = snapshotData['Country'] as String?;
    _aid = snapshotData['aid'] as String?;
    _userid = snapshotData['userid'] as DocumentReference?;
    _adress = snapshotData['Adress'] as String?;
    _addressType = snapshotData['Address_Type'] as String?;
    _defaultAdd = snapshotData['Default_Add'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Adress');

  static Stream<AdressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdressRecord.fromSnapshot(s));

  static Future<AdressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdressRecord.fromSnapshot(s));

  static AdressRecord fromSnapshot(DocumentSnapshot snapshot) => AdressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdressRecordData({
  String? name,
  String? phoneNo,
  int? pINCode,
  String? area,
  String? landmark,
  String? townCityName,
  String? district,
  String? state,
  String? country,
  String? aid,
  DocumentReference? userid,
  String? adress,
  String? addressType,
  bool? defaultAdd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Phone_no': phoneNo,
      'PIN_Code': pINCode,
      'Area': area,
      'Landmark': landmark,
      'Town_CityName': townCityName,
      'District': district,
      'State': state,
      'Country': country,
      'aid': aid,
      'userid': userid,
      'Adress': adress,
      'Address_Type': addressType,
      'Default_Add': defaultAdd,
    }.withoutNulls,
  );

  return firestoreData;
}
