import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogsRecord extends FirestoreRecord {
  BlogsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "trimester" field.
  int? _trimester;
  int get trimester => _trimester ?? 0;
  bool hasTrimester() => _trimester != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "time_of_reading" field.
  String? _timeOfReading;
  String get timeOfReading => _timeOfReading ?? '';
  bool hasTimeOfReading() => _timeOfReading != null;

  // "main_title" field.
  String? _mainTitle;
  String get mainTitle => _mainTitle ?? '';
  bool hasMainTitle() => _mainTitle != null;

  // "chapter_one" field.
  String? _chapterOne;
  String get chapterOne => _chapterOne ?? '';
  bool hasChapterOne() => _chapterOne != null;

  // "chapter_two" field.
  String? _chapterTwo;
  String get chapterTwo => _chapterTwo ?? '';
  bool hasChapterTwo() => _chapterTwo != null;

  // "title_one" field.
  String? _titleOne;
  String get titleOne => _titleOne ?? '';
  bool hasTitleOne() => _titleOne != null;

  // "chapter_three" field.
  String? _chapterThree;
  String get chapterThree => _chapterThree ?? '';
  bool hasChapterThree() => _chapterThree != null;

  // "chapter_four" field.
  String? _chapterFour;
  String get chapterFour => _chapterFour ?? '';
  bool hasChapterFour() => _chapterFour != null;

  // "title_two" field.
  String? _titleTwo;
  String get titleTwo => _titleTwo ?? '';
  bool hasTitleTwo() => _titleTwo != null;

  // "chapter_five" field.
  String? _chapterFive;
  String get chapterFive => _chapterFive ?? '';
  bool hasChapterFive() => _chapterFive != null;

  // "chapter_six" field.
  String? _chapterSix;
  String get chapterSix => _chapterSix ?? '';
  bool hasChapterSix() => _chapterSix != null;

  // "title_three" field.
  String? _titleThree;
  String get titleThree => _titleThree ?? '';
  bool hasTitleThree() => _titleThree != null;

  // "chapter_seven" field.
  String? _chapterSeven;
  String get chapterSeven => _chapterSeven ?? '';
  bool hasChapterSeven() => _chapterSeven != null;

  // "title_four" field.
  String? _titleFour;
  String get titleFour => _titleFour ?? '';
  bool hasTitleFour() => _titleFour != null;

  // "chapter_eight" field.
  String? _chapterEight;
  String get chapterEight => _chapterEight ?? '';
  bool hasChapterEight() => _chapterEight != null;

  // "conclusion" field.
  String? _conclusion;
  String get conclusion => _conclusion ?? '';
  bool hasConclusion() => _conclusion != null;

  // "title_five" field.
  String? _titleFive;
  String get titleFive => _titleFive ?? '';
  bool hasTitleFive() => _titleFive != null;

  // "five_a" field.
  String? _fiveA;
  String get fiveA => _fiveA ?? '';
  bool hasFiveA() => _fiveA != null;

  // "title_six" field.
  String? _titleSix;
  String get titleSix => _titleSix ?? '';
  bool hasTitleSix() => _titleSix != null;

  // "six_a" field.
  String? _sixA;
  String get sixA => _sixA ?? '';
  bool hasSixA() => _sixA != null;

  // "title_seven" field.
  String? _titleSeven;
  String get titleSeven => _titleSeven ?? '';
  bool hasTitleSeven() => _titleSeven != null;

  // "seven_a" field.
  String? _sevenA;
  String get sevenA => _sevenA ?? '';
  bool hasSevenA() => _sevenA != null;

  // "title_eight" field.
  String? _titleEight;
  String get titleEight => _titleEight ?? '';
  bool hasTitleEight() => _titleEight != null;

  // "eight_a" field.
  String? _eightA;
  String get eightA => _eightA ?? '';
  bool hasEightA() => _eightA != null;

  // "title_nine" field.
  String? _titleNine;
  String get titleNine => _titleNine ?? '';
  bool hasTitleNine() => _titleNine != null;

  // "nine_a" field.
  String? _nineA;
  String get nineA => _nineA ?? '';
  bool hasNineA() => _nineA != null;

  // "title_ten" field.
  String? _titleTen;
  String get titleTen => _titleTen ?? '';
  bool hasTitleTen() => _titleTen != null;

  // "ten_a" field.
  String? _tenA;
  String get tenA => _tenA ?? '';
  bool hasTenA() => _tenA != null;

  void _initializeFields() {
    _trimester = castToType<int>(snapshotData['trimester']);
    _image = snapshotData['image'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _timeOfReading = snapshotData['time_of_reading'] as String?;
    _mainTitle = snapshotData['main_title'] as String?;
    _chapterOne = snapshotData['chapter_one'] as String?;
    _chapterTwo = snapshotData['chapter_two'] as String?;
    _titleOne = snapshotData['title_one'] as String?;
    _chapterThree = snapshotData['chapter_three'] as String?;
    _chapterFour = snapshotData['chapter_four'] as String?;
    _titleTwo = snapshotData['title_two'] as String?;
    _chapterFive = snapshotData['chapter_five'] as String?;
    _chapterSix = snapshotData['chapter_six'] as String?;
    _titleThree = snapshotData['title_three'] as String?;
    _chapterSeven = snapshotData['chapter_seven'] as String?;
    _titleFour = snapshotData['title_four'] as String?;
    _chapterEight = snapshotData['chapter_eight'] as String?;
    _conclusion = snapshotData['conclusion'] as String?;
    _titleFive = snapshotData['title_five'] as String?;
    _fiveA = snapshotData['five_a'] as String?;
    _titleSix = snapshotData['title_six'] as String?;
    _sixA = snapshotData['six_a'] as String?;
    _titleSeven = snapshotData['title_seven'] as String?;
    _sevenA = snapshotData['seven_a'] as String?;
    _titleEight = snapshotData['title_eight'] as String?;
    _eightA = snapshotData['eight_a'] as String?;
    _titleNine = snapshotData['title_nine'] as String?;
    _nineA = snapshotData['nine_a'] as String?;
    _titleTen = snapshotData['title_ten'] as String?;
    _tenA = snapshotData['ten_a'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blogs');

  static Stream<BlogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlogsRecord.fromSnapshot(s));

  static Future<BlogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlogsRecord.fromSnapshot(s));

  static BlogsRecord fromSnapshot(DocumentSnapshot snapshot) => BlogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlogsRecordData({
  int? trimester,
  String? image,
  DateTime? date,
  String? timeOfReading,
  String? mainTitle,
  String? chapterOne,
  String? chapterTwo,
  String? titleOne,
  String? chapterThree,
  String? chapterFour,
  String? titleTwo,
  String? chapterFive,
  String? chapterSix,
  String? titleThree,
  String? chapterSeven,
  String? titleFour,
  String? chapterEight,
  String? conclusion,
  String? titleFive,
  String? fiveA,
  String? titleSix,
  String? sixA,
  String? titleSeven,
  String? sevenA,
  String? titleEight,
  String? eightA,
  String? titleNine,
  String? nineA,
  String? titleTen,
  String? tenA,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'trimester': trimester,
      'image': image,
      'date': date,
      'time_of_reading': timeOfReading,
      'main_title': mainTitle,
      'chapter_one': chapterOne,
      'chapter_two': chapterTwo,
      'title_one': titleOne,
      'chapter_three': chapterThree,
      'chapter_four': chapterFour,
      'title_two': titleTwo,
      'chapter_five': chapterFive,
      'chapter_six': chapterSix,
      'title_three': titleThree,
      'chapter_seven': chapterSeven,
      'title_four': titleFour,
      'chapter_eight': chapterEight,
      'conclusion': conclusion,
      'title_five': titleFive,
      'five_a': fiveA,
      'title_six': titleSix,
      'six_a': sixA,
      'title_seven': titleSeven,
      'seven_a': sevenA,
      'title_eight': titleEight,
      'eight_a': eightA,
      'title_nine': titleNine,
      'nine_a': nineA,
      'title_ten': titleTen,
      'ten_a': tenA,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlogsRecordDocumentEquality implements Equality<BlogsRecord> {
  const BlogsRecordDocumentEquality();

  @override
  bool equals(BlogsRecord? e1, BlogsRecord? e2) {
    return e1?.trimester == e2?.trimester &&
        e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        e1?.timeOfReading == e2?.timeOfReading &&
        e1?.mainTitle == e2?.mainTitle &&
        e1?.chapterOne == e2?.chapterOne &&
        e1?.chapterTwo == e2?.chapterTwo &&
        e1?.titleOne == e2?.titleOne &&
        e1?.chapterThree == e2?.chapterThree &&
        e1?.chapterFour == e2?.chapterFour &&
        e1?.titleTwo == e2?.titleTwo &&
        e1?.chapterFive == e2?.chapterFive &&
        e1?.chapterSix == e2?.chapterSix &&
        e1?.titleThree == e2?.titleThree &&
        e1?.chapterSeven == e2?.chapterSeven &&
        e1?.titleFour == e2?.titleFour &&
        e1?.chapterEight == e2?.chapterEight &&
        e1?.conclusion == e2?.conclusion &&
        e1?.titleFive == e2?.titleFive &&
        e1?.fiveA == e2?.fiveA &&
        e1?.titleSix == e2?.titleSix &&
        e1?.sixA == e2?.sixA &&
        e1?.titleSeven == e2?.titleSeven &&
        e1?.sevenA == e2?.sevenA &&
        e1?.titleEight == e2?.titleEight &&
        e1?.eightA == e2?.eightA &&
        e1?.titleNine == e2?.titleNine &&
        e1?.nineA == e2?.nineA &&
        e1?.titleTen == e2?.titleTen &&
        e1?.tenA == e2?.tenA;
  }

  @override
  int hash(BlogsRecord? e) => const ListEquality().hash([
        e?.trimester,
        e?.image,
        e?.date,
        e?.timeOfReading,
        e?.mainTitle,
        e?.chapterOne,
        e?.chapterTwo,
        e?.titleOne,
        e?.chapterThree,
        e?.chapterFour,
        e?.titleTwo,
        e?.chapterFive,
        e?.chapterSix,
        e?.titleThree,
        e?.chapterSeven,
        e?.titleFour,
        e?.chapterEight,
        e?.conclusion,
        e?.titleFive,
        e?.fiveA,
        e?.titleSix,
        e?.sixA,
        e?.titleSeven,
        e?.sevenA,
        e?.titleEight,
        e?.eightA,
        e?.titleNine,
        e?.nineA,
        e?.titleTen,
        e?.tenA
      ]);

  @override
  bool isValidKey(Object? o) => o is BlogsRecord;
}
