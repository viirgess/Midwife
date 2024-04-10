import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PregnancyCommunityForumRecord extends FirestoreRecord {
  PregnancyCommunityForumRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "isPregnant" field.
  bool? _isPregnant;
  bool get isPregnant => _isPregnant ?? false;
  bool hasIsPregnant() => _isPregnant != null;

  // "picturePath" field.
  String? _picturePath;
  String get picturePath => _picturePath ?? '';
  bool hasPicturePath() => _picturePath != null;

  // "videoPath" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  void _initializeFields() {
    _authorRef = snapshotData['author_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = castToType<int>(snapshotData['likes']);
    _text = snapshotData['text'] as String?;
    _postLikes = getDataList(snapshotData['postLikes']);
    _isPregnant = snapshotData['isPregnant'] as bool?;
    _picturePath = snapshotData['picturePath'] as String?;
    _videoPath = snapshotData['videoPath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pregnancy_community_forum');

  static Stream<PregnancyCommunityForumRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PregnancyCommunityForumRecord.fromSnapshot(s));

  static Future<PregnancyCommunityForumRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PregnancyCommunityForumRecord.fromSnapshot(s));

  static PregnancyCommunityForumRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PregnancyCommunityForumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PregnancyCommunityForumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PregnancyCommunityForumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PregnancyCommunityForumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PregnancyCommunityForumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPregnancyCommunityForumRecordData({
  DocumentReference? authorRef,
  DateTime? createdTime,
  int? likes,
  String? text,
  bool? isPregnant,
  String? picturePath,
  String? videoPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author_ref': authorRef,
      'created_time': createdTime,
      'likes': likes,
      'text': text,
      'isPregnant': isPregnant,
      'picturePath': picturePath,
      'videoPath': videoPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class PregnancyCommunityForumRecordDocumentEquality
    implements Equality<PregnancyCommunityForumRecord> {
  const PregnancyCommunityForumRecordDocumentEquality();

  @override
  bool equals(
      PregnancyCommunityForumRecord? e1, PregnancyCommunityForumRecord? e2) {
    const listEquality = ListEquality();
    return e1?.authorRef == e2?.authorRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.likes == e2?.likes &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.postLikes, e2?.postLikes) &&
        e1?.isPregnant == e2?.isPregnant &&
        e1?.picturePath == e2?.picturePath &&
        e1?.videoPath == e2?.videoPath;
  }

  @override
  int hash(PregnancyCommunityForumRecord? e) => const ListEquality().hash([
        e?.authorRef,
        e?.createdTime,
        e?.likes,
        e?.text,
        e?.postLikes,
        e?.isPregnant,
        e?.picturePath,
        e?.videoPath
      ]);

  @override
  bool isValidKey(Object? o) => o is PregnancyCommunityForumRecord;
}
