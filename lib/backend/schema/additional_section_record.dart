import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalSectionRecord extends FirestoreRecord {
  AdditionalSectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "one" field.
  String? _one;
  String get one => _one ?? '';
  bool hasOne() => _one != null;

  // "two" field.
  String? _two;
  String get two => _two ?? '';
  bool hasTwo() => _two != null;

  // "three" field.
  String? _three;
  String get three => _three ?? '';
  bool hasThree() => _three != null;

  // "four" field.
  String? _four;
  String get four => _four ?? '';
  bool hasFour() => _four != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "second_title" field.
  String? _secondTitle;
  String get secondTitle => _secondTitle ?? '';
  bool hasSecondTitle() => _secondTitle != null;

  // "s_one" field.
  String? _sOne;
  String get sOne => _sOne ?? '';
  bool hasSOne() => _sOne != null;

  // "s_two" field.
  String? _sTwo;
  String get sTwo => _sTwo ?? '';
  bool hasSTwo() => _sTwo != null;

  // "s_three" field.
  String? _sThree;
  String get sThree => _sThree ?? '';
  bool hasSThree() => _sThree != null;

  // "s_four" field.
  String? _sFour;
  String get sFour => _sFour ?? '';
  bool hasSFour() => _sFour != null;

  // "s_five" field.
  String? _sFive;
  String get sFive => _sFive ?? '';
  bool hasSFive() => _sFive != null;

  // "s_six" field.
  String? _sSix;
  String get sSix => _sSix ?? '';
  bool hasSSix() => _sSix != null;

  // "chapter" field.
  String? _chapter;
  String get chapter => _chapter ?? '';
  bool hasChapter() => _chapter != null;

  // "conclusion" field.
  String? _conclusion;
  String get conclusion => _conclusion ?? '';
  bool hasConclusion() => _conclusion != null;

  // "five" field.
  String? _five;
  String get five => _five ?? '';
  bool hasFive() => _five != null;

  // "six" field.
  String? _six;
  String get six => _six ?? '';
  bool hasSix() => _six != null;

  // "seven" field.
  String? _seven;
  String get seven => _seven ?? '';
  bool hasSeven() => _seven != null;

  // "eight" field.
  String? _eight;
  String get eight => _eight ?? '';
  bool hasEight() => _eight != null;

  // "nine" field.
  String? _nine;
  String get nine => _nine ?? '';
  bool hasNine() => _nine != null;

  // "ten" field.
  String? _ten;
  String get ten => _ten ?? '';
  bool hasTen() => _ten != null;

  // "eleven" field.
  String? _eleven;
  String get eleven => _eleven ?? '';
  bool hasEleven() => _eleven != null;

  // "twelve" field.
  String? _twelve;
  String get twelve => _twelve ?? '';
  bool hasTwelve() => _twelve != null;

  // "s_seven" field.
  String? _sSeven;
  String get sSeven => _sSeven ?? '';
  bool hasSSeven() => _sSeven != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _one = snapshotData['one'] as String?;
    _two = snapshotData['two'] as String?;
    _three = snapshotData['three'] as String?;
    _four = snapshotData['four'] as String?;
    _title = snapshotData['title'] as String?;
    _secondTitle = snapshotData['second_title'] as String?;
    _sOne = snapshotData['s_one'] as String?;
    _sTwo = snapshotData['s_two'] as String?;
    _sThree = snapshotData['s_three'] as String?;
    _sFour = snapshotData['s_four'] as String?;
    _sFive = snapshotData['s_five'] as String?;
    _sSix = snapshotData['s_six'] as String?;
    _chapter = snapshotData['chapter'] as String?;
    _conclusion = snapshotData['conclusion'] as String?;
    _five = snapshotData['five'] as String?;
    _six = snapshotData['six'] as String?;
    _seven = snapshotData['seven'] as String?;
    _eight = snapshotData['eight'] as String?;
    _nine = snapshotData['nine'] as String?;
    _ten = snapshotData['ten'] as String?;
    _eleven = snapshotData['eleven'] as String?;
    _twelve = snapshotData['twelve'] as String?;
    _sSeven = snapshotData['s_seven'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('additional_section')
          : FirebaseFirestore.instance.collectionGroup('additional_section');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('additional_section').doc(id);

  static Stream<AdditionalSectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdditionalSectionRecord.fromSnapshot(s));

  static Future<AdditionalSectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdditionalSectionRecord.fromSnapshot(s));

  static AdditionalSectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdditionalSectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdditionalSectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdditionalSectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdditionalSectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdditionalSectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdditionalSectionRecordData({
  String? one,
  String? two,
  String? three,
  String? four,
  String? title,
  String? secondTitle,
  String? sOne,
  String? sTwo,
  String? sThree,
  String? sFour,
  String? sFive,
  String? sSix,
  String? chapter,
  String? conclusion,
  String? five,
  String? six,
  String? seven,
  String? eight,
  String? nine,
  String? ten,
  String? eleven,
  String? twelve,
  String? sSeven,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'one': one,
      'two': two,
      'three': three,
      'four': four,
      'title': title,
      'second_title': secondTitle,
      's_one': sOne,
      's_two': sTwo,
      's_three': sThree,
      's_four': sFour,
      's_five': sFive,
      's_six': sSix,
      'chapter': chapter,
      'conclusion': conclusion,
      'five': five,
      'six': six,
      'seven': seven,
      'eight': eight,
      'nine': nine,
      'ten': ten,
      'eleven': eleven,
      'twelve': twelve,
      's_seven': sSeven,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdditionalSectionRecordDocumentEquality
    implements Equality<AdditionalSectionRecord> {
  const AdditionalSectionRecordDocumentEquality();

  @override
  bool equals(AdditionalSectionRecord? e1, AdditionalSectionRecord? e2) {
    return e1?.one == e2?.one &&
        e1?.two == e2?.two &&
        e1?.three == e2?.three &&
        e1?.four == e2?.four &&
        e1?.title == e2?.title &&
        e1?.secondTitle == e2?.secondTitle &&
        e1?.sOne == e2?.sOne &&
        e1?.sTwo == e2?.sTwo &&
        e1?.sThree == e2?.sThree &&
        e1?.sFour == e2?.sFour &&
        e1?.sFive == e2?.sFive &&
        e1?.sSix == e2?.sSix &&
        e1?.chapter == e2?.chapter &&
        e1?.conclusion == e2?.conclusion &&
        e1?.five == e2?.five &&
        e1?.six == e2?.six &&
        e1?.seven == e2?.seven &&
        e1?.eight == e2?.eight &&
        e1?.nine == e2?.nine &&
        e1?.ten == e2?.ten &&
        e1?.eleven == e2?.eleven &&
        e1?.twelve == e2?.twelve &&
        e1?.sSeven == e2?.sSeven;
  }

  @override
  int hash(AdditionalSectionRecord? e) => const ListEquality().hash([
        e?.one,
        e?.two,
        e?.three,
        e?.four,
        e?.title,
        e?.secondTitle,
        e?.sOne,
        e?.sTwo,
        e?.sThree,
        e?.sFour,
        e?.sFive,
        e?.sSix,
        e?.chapter,
        e?.conclusion,
        e?.five,
        e?.six,
        e?.seven,
        e?.eight,
        e?.nine,
        e?.ten,
        e?.eleven,
        e?.twelve,
        e?.sSeven
      ]);

  @override
  bool isValidKey(Object? o) => o is AdditionalSectionRecord;
}
