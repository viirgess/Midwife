import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _userRef = (await secureStorage.getString('ff_userRef'))?.ref ?? _userRef;
    });
    await _safeInitAsync(() async {
      _isWelcomeClosed =
          await secureStorage.getBool('ff_isWelcomeClosed') ?? _isWelcomeClosed;
    });
    await _safeInitAsync(() async {
      _isMainPage = await secureStorage.getBool('ff_isMainPage') ?? _isMainPage;
    });
    await _safeInitAsync(() async {
      _isPregnant = await secureStorage.getBool('ff_isPregnant') ?? _isPregnant;
    });
    await _safeInitAsync(() async {
      _AIChat = await secureStorage.getStringList('ff_AIChat') ?? _AIChat;
    });
    await _safeInitAsync(() async {
      _midwifeRef =
          (await secureStorage.getString('ff_midwifeRef'))?.ref ?? _midwifeRef;
    });
    await _safeInitAsync(() async {
      _listOfMemories = (await secureStorage.getStringList('ff_listOfMemories'))
              ?.map((path) => path.ref)
              .toList() ??
          _listOfMemories;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? value) {
    _userRef = value;
    value != null
        ? secureStorage.setString('ff_userRef', value.path)
        : secureStorage.remove('ff_userRef');
  }

  void deleteUserRef() {
    secureStorage.delete(key: 'ff_userRef');
  }

  bool _isWelcomeClosed = false;
  bool get isWelcomeClosed => _isWelcomeClosed;
  set isWelcomeClosed(bool value) {
    _isWelcomeClosed = value;
    secureStorage.setBool('ff_isWelcomeClosed', value);
  }

  void deleteIsWelcomeClosed() {
    secureStorage.delete(key: 'ff_isWelcomeClosed');
  }

  bool _isMainPage = false;
  bool get isMainPage => _isMainPage;
  set isMainPage(bool value) {
    _isMainPage = value;
    secureStorage.setBool('ff_isMainPage', value);
  }

  void deleteIsMainPage() {
    secureStorage.delete(key: 'ff_isMainPage');
  }

  bool _isPregnant = true;
  bool get isPregnant => _isPregnant;
  set isPregnant(bool value) {
    _isPregnant = value;
    secureStorage.setBool('ff_isPregnant', value);
  }

  void deleteIsPregnant() {
    secureStorage.delete(key: 'ff_isPregnant');
  }

  List<String> _AIChat = [];
  List<String> get AIChat => _AIChat;
  set AIChat(List<String> value) {
    _AIChat = value;
    secureStorage.setStringList('ff_AIChat', value);
  }

  void deleteAIChat() {
    secureStorage.delete(key: 'ff_AIChat');
  }

  void addToAIChat(String value) {
    AIChat.add(value);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  void removeFromAIChat(String value) {
    AIChat.remove(value);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  void removeAtIndexFromAIChat(int index) {
    AIChat.removeAt(index);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  void updateAIChatAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    AIChat[index] = updateFn(_AIChat[index]);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  void insertAtIndexInAIChat(int index, String value) {
    AIChat.insert(index, value);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  DocumentReference? _midwifeRef =
      FirebaseFirestore.instance.doc('/users/BfL7gWodPzOmLe16xIf0JptGNO93');
  DocumentReference? get midwifeRef => _midwifeRef;
  set midwifeRef(DocumentReference? value) {
    _midwifeRef = value;
    value != null
        ? secureStorage.setString('ff_midwifeRef', value.path)
        : secureStorage.remove('ff_midwifeRef');
  }

  void deleteMidwifeRef() {
    secureStorage.delete(key: 'ff_midwifeRef');
  }

  int _selectedindex = 1;
  int get selectedindex => _selectedindex;
  set selectedindex(int value) {
    _selectedindex = value;
  }

  ContractrionStatisticsStruct _contractionStatistics =
      ContractrionStatisticsStruct.fromSerializableMap(jsonDecode(
          '{\"qtyPerHour\":\"0\",\"avgDuration\":\"0\",\"avgInterval\":\"0\"}'));
  ContractrionStatisticsStruct get contractionStatistics =>
      _contractionStatistics;
  set contractionStatistics(ContractrionStatisticsStruct value) {
    _contractionStatistics = value;
  }

  void updateContractionStatisticsStruct(
      Function(ContractrionStatisticsStruct) updateFn) {
    updateFn(_contractionStatistics);
  }

  int _weekForMemories = 0;
  int get weekForMemories => _weekForMemories;
  set weekForMemories(int value) {
    _weekForMemories = value;
  }

  List<DocumentReference> _listOfMemories = [];
  List<DocumentReference> get listOfMemories => _listOfMemories;
  set listOfMemories(List<DocumentReference> value) {
    _listOfMemories = value;
    secureStorage.setStringList(
        'ff_listOfMemories', value.map((x) => x.path).toList());
  }

  void deleteListOfMemories() {
    secureStorage.delete(key: 'ff_listOfMemories');
  }

  void addToListOfMemories(DocumentReference value) {
    listOfMemories.add(value);
    secureStorage.setStringList(
        'ff_listOfMemories', _listOfMemories.map((x) => x.path).toList());
  }

  void removeFromListOfMemories(DocumentReference value) {
    listOfMemories.remove(value);
    secureStorage.setStringList(
        'ff_listOfMemories', _listOfMemories.map((x) => x.path).toList());
  }

  void removeAtIndexFromListOfMemories(int index) {
    listOfMemories.removeAt(index);
    secureStorage.setStringList(
        'ff_listOfMemories', _listOfMemories.map((x) => x.path).toList());
  }

  void updateListOfMemoriesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    listOfMemories[index] = updateFn(_listOfMemories[index]);
    secureStorage.setStringList(
        'ff_listOfMemories', _listOfMemories.map((x) => x.path).toList());
  }

  void insertAtIndexInListOfMemories(int index, DocumentReference value) {
    listOfMemories.insert(index, value);
    secureStorage.setStringList(
        'ff_listOfMemories', _listOfMemories.map((x) => x.path).toList());
  }

  List<String> _uploadedImages = [];
  List<String> get uploadedImages => _uploadedImages;
  set uploadedImages(List<String> value) {
    _uploadedImages = value;
  }

  void addToUploadedImages(String value) {
    uploadedImages.add(value);
  }

  void removeFromUploadedImages(String value) {
    uploadedImages.remove(value);
  }

  void removeAtIndexFromUploadedImages(int index) {
    uploadedImages.removeAt(index);
  }

  void updateUploadedImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    uploadedImages[index] = updateFn(_uploadedImages[index]);
  }

  void insertAtIndexInUploadedImages(int index, String value) {
    uploadedImages.insert(index, value);
  }

  int _cycleDuration = 0;
  int get cycleDuration => _cycleDuration;
  set cycleDuration(int value) {
    _cycleDuration = value;
  }

  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  set dueDate(DateTime? value) {
    _dueDate = value;
  }

  double _initWeight = 0.0;
  double get initWeight => _initWeight;
  set initWeight(double value) {
    _initWeight = value;
  }

  double _currentWeight = 0.0;
  double get currentWeight => _currentWeight;
  set currentWeight(double value) {
    _currentWeight = value;
  }

  double _babyInitWeight = 0.0;
  double get babyInitWeight => _babyInitWeight;
  set babyInitWeight(double value) {
    _babyInitWeight = value;
  }

  double _babyInitHeight = 0.0;
  double get babyInitHeight => _babyInitHeight;
  set babyInitHeight(double value) {
    _babyInitHeight = value;
  }

  double _babyCurrentWeight = 0.0;
  double get babyCurrentWeight => _babyCurrentWeight;
  set babyCurrentWeight(double value) {
    _babyCurrentWeight = value;
  }

  double _babyCurrentHeight = 0.0;
  double get babyCurrentHeight => _babyCurrentHeight;
  set babyCurrentHeight(double value) {
    _babyCurrentHeight = value;
  }

  bool _firstBreast = false;
  bool get firstBreast => _firstBreast;
  set firstBreast(bool value) {
    _firstBreast = value;
  }

  int _durationLeft = 0;
  int get durationLeft => _durationLeft;
  set durationLeft(int value) {
    _durationLeft = value;
  }

  int _durationRight = 0;
  int get durationRight => _durationRight;
  set durationRight(int value) {
    _durationRight = value;
  }

  int _leftPump = 0;
  int get leftPump => _leftPump;
  set leftPump(int value) {
    _leftPump = value;
  }

  int _rightPump = 0;
  int get rightPump => _rightPump;
  set rightPump(int value) {
    _rightPump = value;
  }

  int _bottleFeeding = 0;
  int get bottleFeeding => _bottleFeeding;
  set bottleFeeding(int value) {
    _bottleFeeding = value;
  }

  DocumentReference? _trackerRef;
  DocumentReference? get trackerRef => _trackerRef;
  set trackerRef(DocumentReference? value) {
    _trackerRef = value;
  }

  double _heightPercentile = 0.0;
  double get heightPercentile => _heightPercentile;
  set heightPercentile(double value) {
    _heightPercentile = value;
  }

  double _weightPercentile = 0.0;
  double get weightPercentile => _weightPercentile;
  set weightPercentile(double value) {
    _weightPercentile = value;
  }

  DateTime? _babyBirthDate;
  DateTime? get babyBirthDate => _babyBirthDate;
  set babyBirthDate(DateTime? value) {
    _babyBirthDate = value;
  }

  SupportCategory? _categorySupport;
  SupportCategory? get categorySupport => _categorySupport;
  set categorySupport(SupportCategory? value) {
    _categorySupport = value;
  }

  List<String> _reminderDaysOfWeek = [];
  List<String> get reminderDaysOfWeek => _reminderDaysOfWeek;
  set reminderDaysOfWeek(List<String> value) {
    _reminderDaysOfWeek = value;
  }

  void addToReminderDaysOfWeek(String value) {
    reminderDaysOfWeek.add(value);
  }

  void removeFromReminderDaysOfWeek(String value) {
    reminderDaysOfWeek.remove(value);
  }

  void removeAtIndexFromReminderDaysOfWeek(int index) {
    reminderDaysOfWeek.removeAt(index);
  }

  void updateReminderDaysOfWeekAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    reminderDaysOfWeek[index] = updateFn(_reminderDaysOfWeek[index]);
  }

  void insertAtIndexInReminderDaysOfWeek(int index, String value) {
    reminderDaysOfWeek.insert(index, value);
  }

  final _groupsManager = StreamRequestManager<List<GroupsRecord>>();
  Stream<List<GroupsRecord>> groups({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<GroupsRecord>> Function() requestFn,
  }) =>
      _groupsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGroupsCache() => _groupsManager.clear();
  void clearGroupsCacheKey(String? uniqueKey) =>
      _groupsManager.clearRequest(uniqueKey);

  final _progressManager = FutureRequestManager<int>();
  Future<int> progress({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _progressManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProgressCache() => _progressManager.clear();
  void clearProgressCacheKey(String? uniqueKey) =>
      _progressManager.clearRequest(uniqueKey);

  final _lessonsManager = FutureRequestManager<List<LessonsRecord>>();
  Future<List<LessonsRecord>> lessons({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<LessonsRecord>> Function() requestFn,
  }) =>
      _lessonsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLessonsCache() => _lessonsManager.clear();
  void clearLessonsCacheKey(String? uniqueKey) =>
      _lessonsManager.clearRequest(uniqueKey);

  final _lessonManager = FutureRequestManager<int>();
  Future<int> lesson({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _lessonManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLessonCache() => _lessonManager.clear();
  void clearLessonCacheKey(String? uniqueKey) =>
      _lessonManager.clearRequest(uniqueKey);

  final _memoriesManager = StreamRequestManager<List<MemoriesRecord>>();
  Stream<List<MemoriesRecord>> memories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MemoriesRecord>> Function() requestFn,
  }) =>
      _memoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMemoriesCache() => _memoriesManager.clear();
  void clearMemoriesCacheKey(String? uniqueKey) =>
      _memoriesManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
