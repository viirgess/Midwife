import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FaqRecord extends FirestoreRecord {
  FaqRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "footer" field.
  String? _footer;
  String get footer => _footer ?? '';
  bool hasFooter() => _footer != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _subtitle = snapshotData['subtitle'] as String?;
    _description = snapshotData['description'] as String?;
    _footer = snapshotData['footer'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FAQ');

  static Stream<FaqRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FaqRecord.fromSnapshot(s));

  static Future<FaqRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FaqRecord.fromSnapshot(s));

  static FaqRecord fromSnapshot(DocumentSnapshot snapshot) => FaqRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FaqRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FaqRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FaqRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FaqRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFaqRecordData({
  String? title,
  String? subtitle,
  String? description,
  String? footer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'footer': footer,
    }.withoutNulls,
  );

  return firestoreData;
}

class FaqRecordDocumentEquality implements Equality<FaqRecord> {
  const FaqRecordDocumentEquality();

  @override
  bool equals(FaqRecord? e1, FaqRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.description == e2?.description &&
        e1?.footer == e2?.footer;
  }

  @override
  int hash(FaqRecord? e) => const ListEquality()
      .hash([e?.title, e?.subtitle, e?.description, e?.footer]);

  @override
  bool isValidKey(Object? o) => o is FaqRecord;
}
