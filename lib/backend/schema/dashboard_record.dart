import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DashboardRecord extends FirestoreRecord {
  DashboardRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _icon = snapshotData['icon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dashboard');

  static Stream<DashboardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DashboardRecord.fromSnapshot(s));

  static Future<DashboardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DashboardRecord.fromSnapshot(s));

  static DashboardRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DashboardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DashboardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DashboardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DashboardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DashboardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDashboardRecordData({
  String? category,
  String? title,
  String? description,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'title': title,
      'description': description,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class DashboardRecordDocumentEquality implements Equality<DashboardRecord> {
  const DashboardRecordDocumentEquality();

  @override
  bool equals(DashboardRecord? e1, DashboardRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(DashboardRecord? e) => const ListEquality()
      .hash([e?.category, e?.title, e?.description, e?.icon]);

  @override
  bool isValidKey(Object? o) => o is DashboardRecord;
}
