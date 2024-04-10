// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonStruct extends FFFirebaseStruct {
  LessonStruct({
    String? title,
    String? videoPath,
    bool? isSeen,
    String? lessonId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _videoPath = videoPath,
        _isSeen = isSeen,
        _lessonId = lessonId,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "video_path" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  set videoPath(String? val) => _videoPath = val;
  bool hasVideoPath() => _videoPath != null;

  // "isSeen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  set isSeen(bool? val) => _isSeen = val;
  bool hasIsSeen() => _isSeen != null;

  // "lesson_id" field.
  String? _lessonId;
  String get lessonId => _lessonId ?? '';
  set lessonId(String? val) => _lessonId = val;
  bool hasLessonId() => _lessonId != null;

  static LessonStruct fromMap(Map<String, dynamic> data) => LessonStruct(
        title: data['title'] as String?,
        videoPath: data['video_path'] as String?,
        isSeen: data['isSeen'] as bool?,
        lessonId: data['lesson_id'] as String?,
      );

  static LessonStruct? maybeFromMap(dynamic data) =>
      data is Map ? LessonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'video_path': _videoPath,
        'isSeen': _isSeen,
        'lesson_id': _lessonId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'video_path': serializeParam(
          _videoPath,
          ParamType.String,
        ),
        'isSeen': serializeParam(
          _isSeen,
          ParamType.bool,
        ),
        'lesson_id': serializeParam(
          _lessonId,
          ParamType.String,
        ),
      }.withoutNulls;

  static LessonStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        videoPath: deserializeParam(
          data['video_path'],
          ParamType.String,
          false,
        ),
        isSeen: deserializeParam(
          data['isSeen'],
          ParamType.bool,
          false,
        ),
        lessonId: deserializeParam(
          data['lesson_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LessonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonStruct &&
        title == other.title &&
        videoPath == other.videoPath &&
        isSeen == other.isSeen &&
        lessonId == other.lessonId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, videoPath, isSeen, lessonId]);
}

LessonStruct createLessonStruct({
  String? title,
  String? videoPath,
  bool? isSeen,
  String? lessonId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonStruct(
      title: title,
      videoPath: videoPath,
      isSeen: isSeen,
      lessonId: lessonId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonStruct? updateLessonStruct(
  LessonStruct? lesson, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lesson
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonStructData(
  Map<String, dynamic> firestoreData,
  LessonStruct? lesson,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lesson == null) {
    return;
  }
  if (lesson.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lesson.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonData = getLessonFirestoreData(lesson, forFieldValue);
  final nestedData = lessonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lesson.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonFirestoreData(
  LessonStruct? lesson, [
  bool forFieldValue = false,
]) {
  if (lesson == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lesson.toMap());

  // Add any Firestore field values
  lesson.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonListFirestoreData(
  List<LessonStruct>? lessons,
) =>
    lessons?.map((e) => getLessonFirestoreData(e, true)).toList() ?? [];
