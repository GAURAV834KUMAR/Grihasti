import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ViratUserRecord extends FirestoreRecord {
  ViratUserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "exists" field.
  bool? _exists;
  bool get exists => _exists ?? false;
  bool hasExists() => _exists != null;

  // "Is_Admin" field.
  String? _isAdmin;
  String get isAdmin => _isAdmin ?? '';
  bool hasIsAdmin() => _isAdmin != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _gender = snapshotData['gender'] as String?;
    _exists = snapshotData['exists'] as bool?;
    _isAdmin = snapshotData['Is_Admin'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Virat_User');

  static Stream<ViratUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ViratUserRecord.fromSnapshot(s));

  static Future<ViratUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ViratUserRecord.fromSnapshot(s));

  static ViratUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ViratUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ViratUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ViratUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ViratUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ViratUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createViratUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? gender,
  bool? exists,
  String? isAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'gender': gender,
      'exists': exists,
      'Is_Admin': isAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}
