import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostPregnancyCommunityForumRecord extends FirestoreRecord {
  PostPregnancyCommunityForumRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "author_ref" field.
  DocumentReference? _authorRef;
  DocumentReference? get authorRef => _authorRef;
  bool hasAuthorRef() => _authorRef != null;

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

  // "postLikes" field.
  List<DocumentReference>? _postLikes;
  List<DocumentReference> get postLikes => _postLikes ?? const [];
  bool hasPostLikes() => _postLikes != null;

  void _initializeFields() {
    _authorRef = snapshotData['author_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = castToType<int>(snapshotData['likes']);
    _text = snapshotData['text'] as String?;
    _postLikes = getDataList(snapshotData['postLikes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post_pregnancy_community_forum');

  static Stream<PostPregnancyCommunityForumRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => PostPregnancyCommunityForumRecord.fromSnapshot(s));

  static Future<PostPregnancyCommunityForumRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PostPregnancyCommunityForumRecord.fromSnapshot(s));

  static PostPregnancyCommunityForumRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PostPregnancyCommunityForumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostPregnancyCommunityForumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostPregnancyCommunityForumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostPregnancyCommunityForumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostPregnancyCommunityForumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostPregnancyCommunityForumRecordData({
  DocumentReference? authorRef,
  DateTime? createdTime,
  int? likes,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author_ref': authorRef,
      'created_time': createdTime,
      'likes': likes,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostPregnancyCommunityForumRecordDocumentEquality
    implements Equality<PostPregnancyCommunityForumRecord> {
  const PostPregnancyCommunityForumRecordDocumentEquality();

  @override
  bool equals(PostPregnancyCommunityForumRecord? e1,
      PostPregnancyCommunityForumRecord? e2) {
    const listEquality = ListEquality();
    return e1?.authorRef == e2?.authorRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.likes == e2?.likes &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.postLikes, e2?.postLikes);
  }

  @override
  int hash(PostPregnancyCommunityForumRecord? e) => const ListEquality()
      .hash([e?.authorRef, e?.createdTime, e?.likes, e?.text, e?.postLikes]);

  @override
  bool isValidKey(Object? o) => o is PostPregnancyCommunityForumRecord;
}
