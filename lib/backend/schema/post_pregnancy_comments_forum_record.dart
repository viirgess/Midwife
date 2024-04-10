import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostPregnancyCommentsForumRecord extends FirestoreRecord {
  PostPregnancyCommentsForumRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "topic_ref" field.
  DocumentReference? _topicRef;
  DocumentReference? get topicRef => _topicRef;
  bool hasTopicRef() => _topicRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "commentLikes" field.
  List<DocumentReference>? _commentLikes;
  List<DocumentReference> get commentLikes => _commentLikes ?? const [];
  bool hasCommentLikes() => _commentLikes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _topicRef = snapshotData['topic_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = castToType<int>(snapshotData['likes']);
    _text = snapshotData['text'] as String?;
    _commentLikes = getDataList(snapshotData['commentLikes']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('post_pregnancy_comments_forum')
          : FirebaseFirestore.instance
              .collectionGroup('post_pregnancy_comments_forum');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('post_pregnancy_comments_forum').doc(id);

  static Stream<PostPregnancyCommentsForumRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => PostPregnancyCommentsForumRecord.fromSnapshot(s));

  static Future<PostPregnancyCommentsForumRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PostPregnancyCommentsForumRecord.fromSnapshot(s));

  static PostPregnancyCommentsForumRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PostPregnancyCommentsForumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostPregnancyCommentsForumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostPregnancyCommentsForumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostPregnancyCommentsForumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostPregnancyCommentsForumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostPregnancyCommentsForumRecordData({
  DocumentReference? createdBy,
  DocumentReference? topicRef,
  DateTime? createdTime,
  int? likes,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'topic_ref': topicRef,
      'created_time': createdTime,
      'likes': likes,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostPregnancyCommentsForumRecordDocumentEquality
    implements Equality<PostPregnancyCommentsForumRecord> {
  const PostPregnancyCommentsForumRecordDocumentEquality();

  @override
  bool equals(PostPregnancyCommentsForumRecord? e1,
      PostPregnancyCommentsForumRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdBy == e2?.createdBy &&
        e1?.topicRef == e2?.topicRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.likes == e2?.likes &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.commentLikes, e2?.commentLikes);
  }

  @override
  int hash(PostPregnancyCommentsForumRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.topicRef,
        e?.createdTime,
        e?.likes,
        e?.text,
        e?.commentLikes
      ]);

  @override
  bool isValidKey(Object? o) => o is PostPregnancyCommentsForumRecord;
}
