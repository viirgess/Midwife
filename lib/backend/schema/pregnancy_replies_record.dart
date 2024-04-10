import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PregnancyRepliesRecord extends FirestoreRecord {
  PregnancyRepliesRecord._(
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

  // "commentRef" field.
  DocumentReference? _commentRef;
  DocumentReference? get commentRef => _commentRef;
  bool hasCommentRef() => _commentRef != null;

  // "picturePath" field.
  String? _picturePath;
  String get picturePath => _picturePath ?? '';
  bool hasPicturePath() => _picturePath != null;

  // "videoPath" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _topicRef = snapshotData['topic_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = castToType<int>(snapshotData['likes']);
    _text = snapshotData['text'] as String?;
    _commentLikes = getDataList(snapshotData['commentLikes']);
    _commentRef = snapshotData['commentRef'] as DocumentReference?;
    _picturePath = snapshotData['picturePath'] as String?;
    _videoPath = snapshotData['videoPath'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pregnancy_replies')
          : FirebaseFirestore.instance.collectionGroup('pregnancy_replies');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pregnancy_replies').doc(id);

  static Stream<PregnancyRepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PregnancyRepliesRecord.fromSnapshot(s));

  static Future<PregnancyRepliesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PregnancyRepliesRecord.fromSnapshot(s));

  static PregnancyRepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PregnancyRepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PregnancyRepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PregnancyRepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PregnancyRepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PregnancyRepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPregnancyRepliesRecordData({
  DocumentReference? createdBy,
  DocumentReference? topicRef,
  DateTime? createdTime,
  int? likes,
  String? text,
  DocumentReference? commentRef,
  String? picturePath,
  String? videoPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'topic_ref': topicRef,
      'created_time': createdTime,
      'likes': likes,
      'text': text,
      'commentRef': commentRef,
      'picturePath': picturePath,
      'videoPath': videoPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class PregnancyRepliesRecordDocumentEquality
    implements Equality<PregnancyRepliesRecord> {
  const PregnancyRepliesRecordDocumentEquality();

  @override
  bool equals(PregnancyRepliesRecord? e1, PregnancyRepliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdBy == e2?.createdBy &&
        e1?.topicRef == e2?.topicRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.likes == e2?.likes &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.commentLikes, e2?.commentLikes) &&
        e1?.commentRef == e2?.commentRef &&
        e1?.picturePath == e2?.picturePath &&
        e1?.videoPath == e2?.videoPath;
  }

  @override
  int hash(PregnancyRepliesRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.topicRef,
        e?.createdTime,
        e?.likes,
        e?.text,
        e?.commentLikes,
        e?.commentRef,
        e?.picturePath,
        e?.videoPath
      ]);

  @override
  bool isValidKey(Object? o) => o is PregnancyRepliesRecord;
}
