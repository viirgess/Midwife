import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicsRecord extends FirestoreRecord {
  TopicsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "short_description" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "topic_one" field.
  String? _topicOne;
  String get topicOne => _topicOne ?? '';
  bool hasTopicOne() => _topicOne != null;

  // "one_description" field.
  String? _oneDescription;
  String get oneDescription => _oneDescription ?? '';
  bool hasOneDescription() => _oneDescription != null;

  // "topic_two" field.
  String? _topicTwo;
  String get topicTwo => _topicTwo ?? '';
  bool hasTopicTwo() => _topicTwo != null;

  // "two_description" field.
  String? _twoDescription;
  String get twoDescription => _twoDescription ?? '';
  bool hasTwoDescription() => _twoDescription != null;

  // "topic_three" field.
  String? _topicThree;
  String get topicThree => _topicThree ?? '';
  bool hasTopicThree() => _topicThree != null;

  // "three_description" field.
  String? _threeDescription;
  String get threeDescription => _threeDescription ?? '';
  bool hasThreeDescription() => _threeDescription != null;

  // "topic_four" field.
  String? _topicFour;
  String get topicFour => _topicFour ?? '';
  bool hasTopicFour() => _topicFour != null;

  // "four_description" field.
  String? _fourDescription;
  String get fourDescription => _fourDescription ?? '';
  bool hasFourDescription() => _fourDescription != null;

  // "topic_five" field.
  String? _topicFive;
  String get topicFive => _topicFive ?? '';
  bool hasTopicFive() => _topicFive != null;

  // "five_description" field.
  String? _fiveDescription;
  String get fiveDescription => _fiveDescription ?? '';
  bool hasFiveDescription() => _fiveDescription != null;

  // "six_description" field.
  String? _sixDescription;
  String get sixDescription => _sixDescription ?? '';
  bool hasSixDescription() => _sixDescription != null;

  // "topic_six" field.
  String? _topicSix;
  String get topicSix => _topicSix ?? '';
  bool hasTopicSix() => _topicSix != null;

  // "chapter_title" field.
  String? _chapterTitle;
  String get chapterTitle => _chapterTitle ?? '';
  bool hasChapterTitle() => _chapterTitle != null;

  // "chapter_one" field.
  String? _chapterOne;
  String get chapterOne => _chapterOne ?? '';
  bool hasChapterOne() => _chapterOne != null;

  // "chapter_two" field.
  String? _chapterTwo;
  String get chapterTwo => _chapterTwo ?? '';
  bool hasChapterTwo() => _chapterTwo != null;

  // "chapter_three" field.
  String? _chapterThree;
  String get chapterThree => _chapterThree ?? '';
  bool hasChapterThree() => _chapterThree != null;

  // "part_one" field.
  String? _partOne;
  String get partOne => _partOne ?? '';
  bool hasPartOne() => _partOne != null;

  // "part_one_description" field.
  String? _partOneDescription;
  String get partOneDescription => _partOneDescription ?? '';
  bool hasPartOneDescription() => _partOneDescription != null;

  // "part_two" field.
  String? _partTwo;
  String get partTwo => _partTwo ?? '';
  bool hasPartTwo() => _partTwo != null;

  // "part_two_description" field.
  String? _partTwoDescription;
  String get partTwoDescription => _partTwoDescription ?? '';
  bool hasPartTwoDescription() => _partTwoDescription != null;

  // "part_three" field.
  String? _partThree;
  String get partThree => _partThree ?? '';
  bool hasPartThree() => _partThree != null;

  // "part_three_description" field.
  String? _partThreeDescription;
  String get partThreeDescription => _partThreeDescription ?? '';
  bool hasPartThreeDescription() => _partThreeDescription != null;

  // "part_four" field.
  String? _partFour;
  String get partFour => _partFour ?? '';
  bool hasPartFour() => _partFour != null;

  // "part_four_description" field.
  String? _partFourDescription;
  String get partFourDescription => _partFourDescription ?? '';
  bool hasPartFourDescription() => _partFourDescription != null;

  // "part_five" field.
  String? _partFive;
  String get partFive => _partFive ?? '';
  bool hasPartFive() => _partFive != null;

  // "part_five_description" field.
  String? _partFiveDescription;
  String get partFiveDescription => _partFiveDescription ?? '';
  bool hasPartFiveDescription() => _partFiveDescription != null;

  // "part_six" field.
  String? _partSix;
  String get partSix => _partSix ?? '';
  bool hasPartSix() => _partSix != null;

  // "part_six_description" field.
  String? _partSixDescription;
  String get partSixDescription => _partSixDescription ?? '';
  bool hasPartSixDescription() => _partSixDescription != null;

  // "part_seven" field.
  String? _partSeven;
  String get partSeven => _partSeven ?? '';
  bool hasPartSeven() => _partSeven != null;

  // "part_seven_description" field.
  String? _partSevenDescription;
  String get partSevenDescription => _partSevenDescription ?? '';
  bool hasPartSevenDescription() => _partSevenDescription != null;

  // "part_eight" field.
  String? _partEight;
  String get partEight => _partEight ?? '';
  bool hasPartEight() => _partEight != null;

  // "part_eight_description" field.
  String? _partEightDescription;
  String get partEightDescription => _partEightDescription ?? '';
  bool hasPartEightDescription() => _partEightDescription != null;

  // "part_nine" field.
  String? _partNine;
  String get partNine => _partNine ?? '';
  bool hasPartNine() => _partNine != null;

  // "part_nine_description" field.
  String? _partNineDescription;
  String get partNineDescription => _partNineDescription ?? '';
  bool hasPartNineDescription() => _partNineDescription != null;

  // "part_ten" field.
  String? _partTen;
  String get partTen => _partTen ?? '';
  bool hasPartTen() => _partTen != null;

  // "part_ten_description" field.
  String? _partTenDescription;
  String get partTenDescription => _partTenDescription ?? '';
  bool hasPartTenDescription() => _partTenDescription != null;

  // "chapter_four" field.
  String? _chapterFour;
  String get chapterFour => _chapterFour ?? '';
  bool hasChapterFour() => _chapterFour != null;

  // "chapter_five" field.
  String? _chapterFive;
  String get chapterFive => _chapterFive ?? '';
  bool hasChapterFive() => _chapterFive != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _shortDescription = snapshotData['short_description'] as String?;
    _topicOne = snapshotData['topic_one'] as String?;
    _oneDescription = snapshotData['one_description'] as String?;
    _topicTwo = snapshotData['topic_two'] as String?;
    _twoDescription = snapshotData['two_description'] as String?;
    _topicThree = snapshotData['topic_three'] as String?;
    _threeDescription = snapshotData['three_description'] as String?;
    _topicFour = snapshotData['topic_four'] as String?;
    _fourDescription = snapshotData['four_description'] as String?;
    _topicFive = snapshotData['topic_five'] as String?;
    _fiveDescription = snapshotData['five_description'] as String?;
    _sixDescription = snapshotData['six_description'] as String?;
    _topicSix = snapshotData['topic_six'] as String?;
    _chapterTitle = snapshotData['chapter_title'] as String?;
    _chapterOne = snapshotData['chapter_one'] as String?;
    _chapterTwo = snapshotData['chapter_two'] as String?;
    _chapterThree = snapshotData['chapter_three'] as String?;
    _partOne = snapshotData['part_one'] as String?;
    _partOneDescription = snapshotData['part_one_description'] as String?;
    _partTwo = snapshotData['part_two'] as String?;
    _partTwoDescription = snapshotData['part_two_description'] as String?;
    _partThree = snapshotData['part_three'] as String?;
    _partThreeDescription = snapshotData['part_three_description'] as String?;
    _partFour = snapshotData['part_four'] as String?;
    _partFourDescription = snapshotData['part_four_description'] as String?;
    _partFive = snapshotData['part_five'] as String?;
    _partFiveDescription = snapshotData['part_five_description'] as String?;
    _partSix = snapshotData['part_six'] as String?;
    _partSixDescription = snapshotData['part_six_description'] as String?;
    _partSeven = snapshotData['part_seven'] as String?;
    _partSevenDescription = snapshotData['part_seven_description'] as String?;
    _partEight = snapshotData['part_eight'] as String?;
    _partEightDescription = snapshotData['part_eight_description'] as String?;
    _partNine = snapshotData['part_nine'] as String?;
    _partNineDescription = snapshotData['part_nine_description'] as String?;
    _partTen = snapshotData['part_ten'] as String?;
    _partTenDescription = snapshotData['part_ten_description'] as String?;
    _chapterFour = snapshotData['chapter_four'] as String?;
    _chapterFive = snapshotData['chapter_five'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('topics')
          : FirebaseFirestore.instance.collectionGroup('topics');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('topics').doc(id);

  static Stream<TopicsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicsRecord.fromSnapshot(s));

  static Future<TopicsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicsRecord.fromSnapshot(s));

  static TopicsRecord fromSnapshot(DocumentSnapshot snapshot) => TopicsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicsRecordData({
  String? image,
  DateTime? date,
  String? title,
  String? shortDescription,
  String? topicOne,
  String? oneDescription,
  String? topicTwo,
  String? twoDescription,
  String? topicThree,
  String? threeDescription,
  String? topicFour,
  String? fourDescription,
  String? topicFive,
  String? fiveDescription,
  String? sixDescription,
  String? topicSix,
  String? chapterTitle,
  String? chapterOne,
  String? chapterTwo,
  String? chapterThree,
  String? partOne,
  String? partOneDescription,
  String? partTwo,
  String? partTwoDescription,
  String? partThree,
  String? partThreeDescription,
  String? partFour,
  String? partFourDescription,
  String? partFive,
  String? partFiveDescription,
  String? partSix,
  String? partSixDescription,
  String? partSeven,
  String? partSevenDescription,
  String? partEight,
  String? partEightDescription,
  String? partNine,
  String? partNineDescription,
  String? partTen,
  String? partTenDescription,
  String? chapterFour,
  String? chapterFive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'date': date,
      'title': title,
      'short_description': shortDescription,
      'topic_one': topicOne,
      'one_description': oneDescription,
      'topic_two': topicTwo,
      'two_description': twoDescription,
      'topic_three': topicThree,
      'three_description': threeDescription,
      'topic_four': topicFour,
      'four_description': fourDescription,
      'topic_five': topicFive,
      'five_description': fiveDescription,
      'six_description': sixDescription,
      'topic_six': topicSix,
      'chapter_title': chapterTitle,
      'chapter_one': chapterOne,
      'chapter_two': chapterTwo,
      'chapter_three': chapterThree,
      'part_one': partOne,
      'part_one_description': partOneDescription,
      'part_two': partTwo,
      'part_two_description': partTwoDescription,
      'part_three': partThree,
      'part_three_description': partThreeDescription,
      'part_four': partFour,
      'part_four_description': partFourDescription,
      'part_five': partFive,
      'part_five_description': partFiveDescription,
      'part_six': partSix,
      'part_six_description': partSixDescription,
      'part_seven': partSeven,
      'part_seven_description': partSevenDescription,
      'part_eight': partEight,
      'part_eight_description': partEightDescription,
      'part_nine': partNine,
      'part_nine_description': partNineDescription,
      'part_ten': partTen,
      'part_ten_description': partTenDescription,
      'chapter_four': chapterFour,
      'chapter_five': chapterFive,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicsRecordDocumentEquality implements Equality<TopicsRecord> {
  const TopicsRecordDocumentEquality();

  @override
  bool equals(TopicsRecord? e1, TopicsRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        e1?.title == e2?.title &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.topicOne == e2?.topicOne &&
        e1?.oneDescription == e2?.oneDescription &&
        e1?.topicTwo == e2?.topicTwo &&
        e1?.twoDescription == e2?.twoDescription &&
        e1?.topicThree == e2?.topicThree &&
        e1?.threeDescription == e2?.threeDescription &&
        e1?.topicFour == e2?.topicFour &&
        e1?.fourDescription == e2?.fourDescription &&
        e1?.topicFive == e2?.topicFive &&
        e1?.fiveDescription == e2?.fiveDescription &&
        e1?.sixDescription == e2?.sixDescription &&
        e1?.topicSix == e2?.topicSix &&
        e1?.chapterTitle == e2?.chapterTitle &&
        e1?.chapterOne == e2?.chapterOne &&
        e1?.chapterTwo == e2?.chapterTwo &&
        e1?.chapterThree == e2?.chapterThree &&
        e1?.partOne == e2?.partOne &&
        e1?.partOneDescription == e2?.partOneDescription &&
        e1?.partTwo == e2?.partTwo &&
        e1?.partTwoDescription == e2?.partTwoDescription &&
        e1?.partThree == e2?.partThree &&
        e1?.partThreeDescription == e2?.partThreeDescription &&
        e1?.partFour == e2?.partFour &&
        e1?.partFourDescription == e2?.partFourDescription &&
        e1?.partFive == e2?.partFive &&
        e1?.partFiveDescription == e2?.partFiveDescription &&
        e1?.partSix == e2?.partSix &&
        e1?.partSixDescription == e2?.partSixDescription &&
        e1?.partSeven == e2?.partSeven &&
        e1?.partSevenDescription == e2?.partSevenDescription &&
        e1?.partEight == e2?.partEight &&
        e1?.partEightDescription == e2?.partEightDescription &&
        e1?.partNine == e2?.partNine &&
        e1?.partNineDescription == e2?.partNineDescription &&
        e1?.partTen == e2?.partTen &&
        e1?.partTenDescription == e2?.partTenDescription &&
        e1?.chapterFour == e2?.chapterFour &&
        e1?.chapterFive == e2?.chapterFive;
  }

  @override
  int hash(TopicsRecord? e) => const ListEquality().hash([
        e?.image,
        e?.date,
        e?.title,
        e?.shortDescription,
        e?.topicOne,
        e?.oneDescription,
        e?.topicTwo,
        e?.twoDescription,
        e?.topicThree,
        e?.threeDescription,
        e?.topicFour,
        e?.fourDescription,
        e?.topicFive,
        e?.fiveDescription,
        e?.sixDescription,
        e?.topicSix,
        e?.chapterTitle,
        e?.chapterOne,
        e?.chapterTwo,
        e?.chapterThree,
        e?.partOne,
        e?.partOneDescription,
        e?.partTwo,
        e?.partTwoDescription,
        e?.partThree,
        e?.partThreeDescription,
        e?.partFour,
        e?.partFourDescription,
        e?.partFive,
        e?.partFiveDescription,
        e?.partSix,
        e?.partSixDescription,
        e?.partSeven,
        e?.partSevenDescription,
        e?.partEight,
        e?.partEightDescription,
        e?.partNine,
        e?.partNineDescription,
        e?.partTen,
        e?.partTenDescription,
        e?.chapterFour,
        e?.chapterFive
      ]);

  @override
  bool isValidKey(Object? o) => o is TopicsRecord;
}
