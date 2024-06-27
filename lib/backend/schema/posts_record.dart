import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "auther_ref" field.
  DocumentReference? _autherRef;
  DocumentReference? get autherRef => _autherRef;
  bool hasAutherRef() => _autherRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "group_ref" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "reactions" field.
  List<ReactionStruct>? _reactions;
  List<ReactionStruct> get reactions => _reactions ?? const [];
  bool hasReactions() => _reactions != null;

  // "sex" field.
  bool? _sex;
  bool get sex => _sex ?? false;
  bool hasSex() => _sex != null;

  void _initializeFields() {
    _autherRef = snapshotData['auther_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _title = snapshotData['title'] as String?;
    _details = snapshotData['details'] as String?;
    _photos = getDataList(snapshotData['photos']);
    _groupRef = snapshotData['group_ref'] as DocumentReference?;
    _reactions = getStructList(
      snapshotData['reactions'],
      ReactionStruct.fromMap,
    );
    _sex = snapshotData['sex'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  static PostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PostsRecord.getDocumentFromData(
        {
          'auther_ref': convertAlgoliaParam(
            snapshot.data['auther_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'likes': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['likes'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'title': snapshot.data['title'],
          'details': snapshot.data['details'],
          'photos': safeGet(
            () => snapshot.data['photos'].toList(),
          ),
          'group_ref': convertAlgoliaParam(
            snapshot.data['group_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'reactions': safeGet(
            () => (snapshot.data['reactions'] as Iterable)
                .map((d) => ReactionStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'sex': snapshot.data['sex'],
        },
        PostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PostsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'posts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  DocumentReference? autherRef,
  DateTime? createdTime,
  String? title,
  String? details,
  DocumentReference? groupRef,
  bool? sex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'auther_ref': autherRef,
      'created_time': createdTime,
      'title': title,
      'details': details,
      'group_ref': groupRef,
      'sex': sex,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.autherRef == e2?.autherRef &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.title == e2?.title &&
        e1?.details == e2?.details &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        e1?.groupRef == e2?.groupRef &&
        listEquality.equals(e1?.reactions, e2?.reactions) &&
        e1?.sex == e2?.sex;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.autherRef,
        e?.createdTime,
        e?.likes,
        e?.title,
        e?.details,
        e?.photos,
        e?.groupRef,
        e?.reactions,
        e?.sex
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
