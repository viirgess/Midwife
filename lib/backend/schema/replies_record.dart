import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepliesRecord extends FirestoreRecord {
  RepliesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "comment_ref" field.
  DocumentReference? _commentRef;
  DocumentReference? get commentRef => _commentRef;
  bool hasCommentRef() => _commentRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _commentRef = snapshotData['comment_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _text = snapshotData['text'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('replies')
          : FirebaseFirestore.instance.collectionGroup('replies');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('replies').doc(id);

  static Stream<RepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepliesRecord.fromSnapshot(s));

  static Future<RepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RepliesRecord.fromSnapshot(s));

  static RepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepliesRecordData({
  DocumentReference? createdBy,
  DocumentReference? commentRef,
  DateTime? createdTime,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'comment_ref': commentRef,
      'created_time': createdTime,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepliesRecordDocumentEquality implements Equality<RepliesRecord> {
  const RepliesRecordDocumentEquality();

  @override
  bool equals(RepliesRecord? e1, RepliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdBy == e2?.createdBy &&
        e1?.commentRef == e2?.commentRef &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.text == e2?.text;
  }

  @override
  int hash(RepliesRecord? e) => const ListEquality()
      .hash([e?.createdBy, e?.commentRef, e?.createdTime, e?.likes, e?.text]);

  @override
  bool isValidKey(Object? o) => o is RepliesRecord;
}
