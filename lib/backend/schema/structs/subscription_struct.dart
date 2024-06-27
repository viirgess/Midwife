// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionStruct extends FFFirebaseStruct {
  SubscriptionStruct({
    int? type,
    DateTime? startDate,
    DateTime? expiredDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _startDate = startDate,
        _expiredDate = expiredDate,
        super(firestoreUtilData);

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "expiredDate" field.
  DateTime? _expiredDate;
  DateTime? get expiredDate => _expiredDate;
  set expiredDate(DateTime? val) => _expiredDate = val;

  bool hasExpiredDate() => _expiredDate != null;

  static SubscriptionStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionStruct(
        type: castToType<int>(data['type']),
        startDate: data['startDate'] as DateTime?,
        expiredDate: data['expiredDate'] as DateTime?,
      );

  static SubscriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'startDate': _startDate,
        'expiredDate': _expiredDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'expiredDate': serializeParam(
          _expiredDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SubscriptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubscriptionStruct(
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        expiredDate: deserializeParam(
          data['expiredDate'],
          ParamType.DateTime,
          false,
        ),
      );

  static SubscriptionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SubscriptionStruct(
        type: convertAlgoliaParam(
          data['type'],
          ParamType.int,
          false,
        ),
        startDate: convertAlgoliaParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        expiredDate: convertAlgoliaParam(
          data['expiredDate'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SubscriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionStruct &&
        type == other.type &&
        startDate == other.startDate &&
        expiredDate == other.expiredDate;
  }

  @override
  int get hashCode => const ListEquality().hash([type, startDate, expiredDate]);
}

SubscriptionStruct createSubscriptionStruct({
  int? type,
  DateTime? startDate,
  DateTime? expiredDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubscriptionStruct(
      type: type,
      startDate: startDate,
      expiredDate: expiredDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubscriptionStruct? updateSubscriptionStruct(
  SubscriptionStruct? subscription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subscription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubscriptionStructData(
  Map<String, dynamic> firestoreData,
  SubscriptionStruct? subscription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subscription == null) {
    return;
  }
  if (subscription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subscription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subscriptionData =
      getSubscriptionFirestoreData(subscription, forFieldValue);
  final nestedData =
      subscriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subscription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubscriptionFirestoreData(
  SubscriptionStruct? subscription, [
  bool forFieldValue = false,
]) {
  if (subscription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subscription.toMap());

  // Add any Firestore field values
  subscription.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubscriptionListFirestoreData(
  List<SubscriptionStruct>? subscriptions,
) =>
    subscriptions?.map((e) => getSubscriptionFirestoreData(e, true)).toList() ??
    [];
