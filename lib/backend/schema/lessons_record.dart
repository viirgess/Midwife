import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "video_path" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  // "is_seen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  bool hasIsSeen() => _isSeen != null;

  // "section_ref" field.
  DocumentReference? _sectionRef;
  DocumentReference? get sectionRef => _sectionRef;
  bool hasSectionRef() => _sectionRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _videoPath = snapshotData['video_path'] as String?;
    _isSeen = snapshotData['is_seen'] as bool?;
    _sectionRef = snapshotData['section_ref'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lessons')
          : FirebaseFirestore.instance.collectionGroup('lessons');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lessons').doc(id);

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  String? title,
  String? videoPath,
  bool? isSeen,
  DocumentReference? sectionRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'video_path': videoPath,
      'is_seen': isSeen,
      'section_ref': sectionRef,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.videoPath == e2?.videoPath &&
        e1?.isSeen == e2?.isSeen &&
        e1?.sectionRef == e2?.sectionRef &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality()
      .hash([e?.title, e?.videoPath, e?.isSeen, e?.sectionRef, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
