// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChecklistItemStruct extends FFFirebaseStruct {
  ChecklistItemStruct({
    String? chapter,
    List<String>? contents,
    bool? isMarked,
    String? purchaseTip,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chapter = chapter,
        _contents = contents,
        _isMarked = isMarked,
        _purchaseTip = purchaseTip,
        super(firestoreUtilData);

  // "chapter" field.
  String? _chapter;
  String get chapter => _chapter ?? '';
  set chapter(String? val) => _chapter = val;

  bool hasChapter() => _chapter != null;

  // "contents" field.
  List<String>? _contents;
  List<String> get contents => _contents ?? const [];
  set contents(List<String>? val) => _contents = val;

  void updateContents(Function(List<String>) updateFn) {
    updateFn(_contents ??= []);
  }

  bool hasContents() => _contents != null;

  // "isMarked" field.
  bool? _isMarked;
  bool get isMarked => _isMarked ?? false;
  set isMarked(bool? val) => _isMarked = val;

  bool hasIsMarked() => _isMarked != null;

  // "purchaseTip" field.
  String? _purchaseTip;
  String get purchaseTip => _purchaseTip ?? '';
  set purchaseTip(String? val) => _purchaseTip = val;

  bool hasPurchaseTip() => _purchaseTip != null;

  static ChecklistItemStruct fromMap(Map<String, dynamic> data) =>
      ChecklistItemStruct(
        chapter: data['chapter'] as String?,
        contents: getDataList(data['contents']),
        isMarked: data['isMarked'] as bool?,
        purchaseTip: data['purchaseTip'] as String?,
      );

  static ChecklistItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ChecklistItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chapter': _chapter,
        'contents': _contents,
        'isMarked': _isMarked,
        'purchaseTip': _purchaseTip,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chapter': serializeParam(
          _chapter,
          ParamType.String,
        ),
        'contents': serializeParam(
          _contents,
          ParamType.String,
          isList: true,
        ),
        'isMarked': serializeParam(
          _isMarked,
          ParamType.bool,
        ),
        'purchaseTip': serializeParam(
          _purchaseTip,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChecklistItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChecklistItemStruct(
        chapter: deserializeParam(
          data['chapter'],
          ParamType.String,
          false,
        ),
        contents: deserializeParam<String>(
          data['contents'],
          ParamType.String,
          true,
        ),
        isMarked: deserializeParam(
          data['isMarked'],
          ParamType.bool,
          false,
        ),
        purchaseTip: deserializeParam(
          data['purchaseTip'],
          ParamType.String,
          false,
        ),
      );

  static ChecklistItemStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ChecklistItemStruct(
        chapter: convertAlgoliaParam(
          data['chapter'],
          ParamType.String,
          false,
        ),
        contents: convertAlgoliaParam<String>(
          data['contents'],
          ParamType.String,
          true,
        ),
        isMarked: convertAlgoliaParam(
          data['isMarked'],
          ParamType.bool,
          false,
        ),
        purchaseTip: convertAlgoliaParam(
          data['purchaseTip'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ChecklistItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChecklistItemStruct &&
        chapter == other.chapter &&
        listEquality.equals(contents, other.contents) &&
        isMarked == other.isMarked &&
        purchaseTip == other.purchaseTip;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([chapter, contents, isMarked, purchaseTip]);
}

ChecklistItemStruct createChecklistItemStruct({
  String? chapter,
  bool? isMarked,
  String? purchaseTip,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChecklistItemStruct(
      chapter: chapter,
      isMarked: isMarked,
      purchaseTip: purchaseTip,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChecklistItemStruct? updateChecklistItemStruct(
  ChecklistItemStruct? checklistItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checklistItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChecklistItemStructData(
  Map<String, dynamic> firestoreData,
  ChecklistItemStruct? checklistItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checklistItem == null) {
    return;
  }
  if (checklistItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checklistItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checklistItemData =
      getChecklistItemFirestoreData(checklistItem, forFieldValue);
  final nestedData =
      checklistItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checklistItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChecklistItemFirestoreData(
  ChecklistItemStruct? checklistItem, [
  bool forFieldValue = false,
]) {
  if (checklistItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checklistItem.toMap());

  // Add any Firestore field values
  checklistItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChecklistItemListFirestoreData(
  List<ChecklistItemStruct>? checklistItems,
) =>
    checklistItems
        ?.map((e) => getChecklistItemFirestoreData(e, true))
        .toList() ??
    [];
