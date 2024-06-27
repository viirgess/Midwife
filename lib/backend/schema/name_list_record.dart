import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NameListRecord extends FirestoreRecord {
  NameListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "girls" field.
  List<String>? _girls;
  List<String> get girls => _girls ?? const [];
  bool hasGirls() => _girls != null;

  // "boys" field.
  List<String>? _boys;
  List<String> get boys => _boys ?? const [];
  bool hasBoys() => _boys != null;

  void _initializeFields() {
    _girls = getDataList(snapshotData['girls']);
    _boys = getDataList(snapshotData['boys']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('name_list');

  static Stream<NameListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NameListRecord.fromSnapshot(s));

  static Future<NameListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NameListRecord.fromSnapshot(s));

  static NameListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NameListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NameListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NameListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NameListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NameListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNameListRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class NameListRecordDocumentEquality implements Equality<NameListRecord> {
  const NameListRecordDocumentEquality();

  @override
  bool equals(NameListRecord? e1, NameListRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.girls, e2?.girls) &&
        listEquality.equals(e1?.boys, e2?.boys);
  }

  @override
  int hash(NameListRecord? e) => const ListEquality().hash([e?.girls, e?.boys]);

  @override
  bool isValidKey(Object? o) => o is NameListRecord;
}
