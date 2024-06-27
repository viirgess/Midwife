// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProfileStruct extends FFFirebaseStruct {
  ProfileStruct({
    bool? isPregnant,
    String? firstName,
    String? lastName,
    String? photo,
    DateTime? estimatedDate,
    Gender? babyGender,
    LatLng? location,
    String? locationName,
    bool? sex,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isPregnant = isPregnant,
        _firstName = firstName,
        _lastName = lastName,
        _photo = photo,
        _estimatedDate = estimatedDate,
        _babyGender = babyGender,
        _location = location,
        _locationName = locationName,
        _sex = sex,
        super(firestoreUtilData);

  // "isPregnant" field.
  bool? _isPregnant;
  bool get isPregnant => _isPregnant ?? false;
  set isPregnant(bool? val) => _isPregnant = val;

  bool hasIsPregnant() => _isPregnant != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;

  bool hasPhoto() => _photo != null;

  // "estimatedDate" field.
  DateTime? _estimatedDate;
  DateTime? get estimatedDate => _estimatedDate;
  set estimatedDate(DateTime? val) => _estimatedDate = val;

  bool hasEstimatedDate() => _estimatedDate != null;

  // "babyGender" field.
  Gender? _babyGender;
  Gender? get babyGender => _babyGender;
  set babyGender(Gender? val) => _babyGender = val;

  bool hasBabyGender() => _babyGender != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  set locationName(String? val) => _locationName = val;

  bool hasLocationName() => _locationName != null;

  // "sex" field.
  bool? _sex;
  bool get sex => _sex ?? false;
  set sex(bool? val) => _sex = val;

  bool hasSex() => _sex != null;

  static ProfileStruct fromMap(Map<String, dynamic> data) => ProfileStruct(
        isPregnant: data['isPregnant'] as bool?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        photo: data['photo'] as String?,
        estimatedDate: data['estimatedDate'] as DateTime?,
        babyGender: deserializeEnum<Gender>(data['babyGender']),
        location: data['location'] as LatLng?,
        locationName: data['locationName'] as String?,
        sex: data['sex'] as bool?,
      );

  static ProfileStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProfileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'isPregnant': _isPregnant,
        'firstName': _firstName,
        'lastName': _lastName,
        'photo': _photo,
        'estimatedDate': _estimatedDate,
        'babyGender': _babyGender?.serialize(),
        'location': _location,
        'locationName': _locationName,
        'sex': _sex,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isPregnant': serializeParam(
          _isPregnant,
          ParamType.bool,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'estimatedDate': serializeParam(
          _estimatedDate,
          ParamType.DateTime,
        ),
        'babyGender': serializeParam(
          _babyGender,
          ParamType.Enum,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'locationName': serializeParam(
          _locationName,
          ParamType.String,
        ),
        'sex': serializeParam(
          _sex,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileStruct(
        isPregnant: deserializeParam(
          data['isPregnant'],
          ParamType.bool,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        estimatedDate: deserializeParam(
          data['estimatedDate'],
          ParamType.DateTime,
          false,
        ),
        babyGender: deserializeParam<Gender>(
          data['babyGender'],
          ParamType.Enum,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        locationName: deserializeParam(
          data['locationName'],
          ParamType.String,
          false,
        ),
        sex: deserializeParam(
          data['sex'],
          ParamType.bool,
          false,
        ),
      );

  static ProfileStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProfileStruct(
        isPregnant: convertAlgoliaParam(
          data['isPregnant'],
          ParamType.bool,
          false,
        ),
        firstName: convertAlgoliaParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: convertAlgoliaParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        photo: convertAlgoliaParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        estimatedDate: convertAlgoliaParam(
          data['estimatedDate'],
          ParamType.DateTime,
          false,
        ),
        babyGender: convertAlgoliaParam<Gender>(
          data['babyGender'],
          ParamType.Enum,
          false,
        ),
        location: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        locationName: convertAlgoliaParam(
          data['locationName'],
          ParamType.String,
          false,
        ),
        sex: convertAlgoliaParam(
          data['sex'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileStruct &&
        isPregnant == other.isPregnant &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        photo == other.photo &&
        estimatedDate == other.estimatedDate &&
        babyGender == other.babyGender &&
        location == other.location &&
        locationName == other.locationName &&
        sex == other.sex;
  }

  @override
  int get hashCode => const ListEquality().hash([
        isPregnant,
        firstName,
        lastName,
        photo,
        estimatedDate,
        babyGender,
        location,
        locationName,
        sex
      ]);
}

ProfileStruct createProfileStruct({
  bool? isPregnant,
  String? firstName,
  String? lastName,
  String? photo,
  DateTime? estimatedDate,
  Gender? babyGender,
  LatLng? location,
  String? locationName,
  bool? sex,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfileStruct(
      isPregnant: isPregnant,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
      estimatedDate: estimatedDate,
      babyGender: babyGender,
      location: location,
      locationName: locationName,
      sex: sex,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfileStruct? updateProfileStruct(
  ProfileStruct? profile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfileStructData(
  Map<String, dynamic> firestoreData,
  ProfileStruct? profile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profile == null) {
    return;
  }
  if (profile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && profile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profileData = getProfileFirestoreData(profile, forFieldValue);
  final nestedData = profileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = profile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfileFirestoreData(
  ProfileStruct? profile, [
  bool forFieldValue = false,
]) {
  if (profile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profile.toMap());

  // Add any Firestore field values
  profile.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfileListFirestoreData(
  List<ProfileStruct>? profiles,
) =>
    profiles?.map((e) => getProfileFirestoreData(e, true)).toList() ?? [];
