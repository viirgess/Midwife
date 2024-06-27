import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectionsRecord extends FirestoreRecord {
  SectionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "course_ref" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _courseRef = snapshotData['course_ref'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sections')
          : FirebaseFirestore.instance.collectionGroup('sections');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sections').doc(id);

  static Stream<SectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SectionsRecord.fromSnapshot(s));

  static Future<SectionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SectionsRecord.fromSnapshot(s));

  static SectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSectionsRecordData({
  String? title,
  DocumentReference? courseRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'course_ref': courseRef,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class SectionsRecordDocumentEquality implements Equality<SectionsRecord> {
  const SectionsRecordDocumentEquality();

  @override
  bool equals(SectionsRecord? e1, SectionsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.courseRef == e2?.courseRef &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(SectionsRecord? e) =>
      const ListEquality().hash([e?.title, e?.courseRef, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is SectionsRecord;
}
