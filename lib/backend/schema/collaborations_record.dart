import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollaborationsRecord extends FirestoreRecord {
  CollaborationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  CollaborationType? _type;
  CollaborationType? get type => _type;
  bool hasType() => _type != null;

  // "promo_code" field.
  String? _promoCode;
  String get promoCode => _promoCode ?? '';
  bool hasPromoCode() => _promoCode != null;

  // "discount_value" field.
  int? _discountValue;
  int get discountValue => _discountValue ?? 0;
  bool hasDiscountValue() => _discountValue != null;

  // "discount_type" field.
  DiscountType? _discountType;
  DiscountType? get discountType => _discountType;
  bool hasDiscountType() => _discountType != null;

  // "background_image" field.
  String? _backgroundImage;
  String get backgroundImage => _backgroundImage ?? '';
  bool hasBackgroundImage() => _backgroundImage != null;

  // "logo_image" field.
  String? _logoImage;
  String get logoImage => _logoImage ?? '';
  bool hasLogoImage() => _logoImage != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "short_description" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  void _initializeFields() {
    _type = deserializeEnum<CollaborationType>(snapshotData['type']);
    _promoCode = snapshotData['promo_code'] as String?;
    _discountValue = castToType<int>(snapshotData['discount_value']);
    _discountType =
        deserializeEnum<DiscountType>(snapshotData['discount_type']);
    _backgroundImage = snapshotData['background_image'] as String?;
    _logoImage = snapshotData['logo_image'] as String?;
    _companyName = snapshotData['company_name'] as String?;
    _shortDescription = snapshotData['short_description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('collaborations');

  static Stream<CollaborationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollaborationsRecord.fromSnapshot(s));

  static Future<CollaborationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CollaborationsRecord.fromSnapshot(s));

  static CollaborationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollaborationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollaborationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollaborationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollaborationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollaborationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollaborationsRecordData({
  CollaborationType? type,
  String? promoCode,
  int? discountValue,
  DiscountType? discountType,
  String? backgroundImage,
  String? logoImage,
  String? companyName,
  String? shortDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'promo_code': promoCode,
      'discount_value': discountValue,
      'discount_type': discountType,
      'background_image': backgroundImage,
      'logo_image': logoImage,
      'company_name': companyName,
      'short_description': shortDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class CollaborationsRecordDocumentEquality
    implements Equality<CollaborationsRecord> {
  const CollaborationsRecordDocumentEquality();

  @override
  bool equals(CollaborationsRecord? e1, CollaborationsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.promoCode == e2?.promoCode &&
        e1?.discountValue == e2?.discountValue &&
        e1?.discountType == e2?.discountType &&
        e1?.backgroundImage == e2?.backgroundImage &&
        e1?.logoImage == e2?.logoImage &&
        e1?.companyName == e2?.companyName &&
        e1?.shortDescription == e2?.shortDescription;
  }

  @override
  int hash(CollaborationsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.promoCode,
        e?.discountValue,
        e?.discountType,
        e?.backgroundImage,
        e?.logoImage,
        e?.companyName,
        e?.shortDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is CollaborationsRecord;
}
