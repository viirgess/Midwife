import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
  List<DocumentReference>? _isSeen;
  List<DocumentReference> get isSeen => _isSeen ?? const [];
  bool hasIsSeen() => _isSeen != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _videoPath = snapshotData['video_path'] as String?;
    _isSeen = getDataList(snapshotData['is_seen']);
    _details = snapshotData['details'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _order = castToType<int>(snapshotData['order']);
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
  String? details,
  DateTime? createdAt,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'video_path': videoPath,
      'details': details,
      'createdAt': createdAt,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.videoPath == e2?.videoPath &&
        listEquality.equals(e1?.isSeen, e2?.isSeen) &&
        e1?.details == e2?.details &&
        e1?.createdAt == e2?.createdAt &&
        e1?.order == e2?.order;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash(
      [e?.title, e?.videoPath, e?.isSeen, e?.details, e?.createdAt, e?.order]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
