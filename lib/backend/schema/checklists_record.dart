import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChecklistsRecord extends FirestoreRecord {
  ChecklistsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "tip" field.
  String? _tip;
  String get tip => _tip ?? '';
  bool hasTip() => _tip != null;

  // "checklistItems" field.
  List<ChecklistItemStruct>? _checklistItems;
  List<ChecklistItemStruct> get checklistItems => _checklistItems ?? const [];
  bool hasChecklistItems() => _checklistItems != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _tip = snapshotData['tip'] as String?;
    _checklistItems = getStructList(
      snapshotData['checklistItems'],
      ChecklistItemStruct.fromMap,
    );
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checklists');

  static Stream<ChecklistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChecklistsRecord.fromSnapshot(s));

  static Future<ChecklistsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChecklistsRecord.fromSnapshot(s));

  static ChecklistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChecklistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChecklistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChecklistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChecklistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChecklistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChecklistsRecordData({
  String? title,
  String? tip,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'tip': tip,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChecklistsRecordDocumentEquality implements Equality<ChecklistsRecord> {
  const ChecklistsRecordDocumentEquality();

  @override
  bool equals(ChecklistsRecord? e1, ChecklistsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.tip == e2?.tip &&
        listEquality.equals(e1?.checklistItems, e2?.checklistItems) &&
        e1?.order == e2?.order;
  }

  @override
  int hash(ChecklistsRecord? e) => const ListEquality()
      .hash([e?.title, e?.tip, e?.checklistItems, e?.order]);

  @override
  bool isValidKey(Object? o) => o is ChecklistsRecord;
}
