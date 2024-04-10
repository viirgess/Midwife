import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
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
    secureStorage = FlutterSecureStorage();
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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _isMainPage = false;
  bool get isMainPage => _isMainPage;
  set isMainPage(bool _value) {
    _isMainPage = _value;
    secureStorage.setBool('ff_isMainPage', _value);
  }

  void deleteIsMainPage() {
    secureStorage.delete(key: 'ff_isMainPage');
  }

  bool _isPregnant = true;
  bool get isPregnant => _isPregnant;
  set isPregnant(bool _value) {
    _isPregnant = _value;
    secureStorage.setBool('ff_isPregnant', _value);
  }

  void deleteIsPregnant() {
    secureStorage.delete(key: 'ff_isPregnant');
  }

  List<String> _AIChat = [];
  List<String> get AIChat => _AIChat;
  set AIChat(List<String> _value) {
    _AIChat = _value;
    secureStorage.setStringList('ff_AIChat', _value);
  }

  void deleteAIChat() {
    secureStorage.delete(key: 'ff_AIChat');
  }

  void addToAIChat(String _value) {
    _AIChat.add(_value);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  void removeFromAIChat(String _value) {
    _AIChat.remove(_value);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  void removeAtIndexFromAIChat(int _index) {
    _AIChat.removeAt(_index);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  void updateAIChatAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _AIChat[_index] = updateFn(_AIChat[_index]);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  void insertAtIndexInAIChat(int _index, String _value) {
    _AIChat.insert(_index, _value);
    secureStorage.setStringList('ff_AIChat', _AIChat);
  }

  DocumentReference? _midwifeRef =
      FirebaseFirestore.instance.doc('/users/BfL7gWodPzOmLe16xIf0JptGNO93');
  DocumentReference? get midwifeRef => _midwifeRef;
  set midwifeRef(DocumentReference? _value) {
    _midwifeRef = _value;
    _value != null
        ? secureStorage.setString('ff_midwifeRef', _value.path)
        : secureStorage.remove('ff_midwifeRef');
  }

  void deleteMidwifeRef() {
    secureStorage.delete(key: 'ff_midwifeRef');
  }

  final _pregnancyForumManager =
      StreamRequestManager<List<PregnancyCommunityForumRecord>>();
  Stream<List<PregnancyCommunityForumRecord>> pregnancyForum({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PregnancyCommunityForumRecord>> Function() requestFn,
  }) =>
      _pregnancyForumManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPregnancyForumCache() => _pregnancyForumManager.clear();
  void clearPregnancyForumCacheKey(String? uniqueKey) =>
      _pregnancyForumManager.clearRequest(uniqueKey);

  final _postPregnantForumManager =
      StreamRequestManager<List<PregnancyCommunityForumRecord>>();
  Stream<List<PregnancyCommunityForumRecord>> postPregnantForum({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PregnancyCommunityForumRecord>> Function() requestFn,
  }) =>
      _postPregnantForumManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostPregnantForumCache() => _postPregnantForumManager.clear();
  void clearPostPregnantForumCacheKey(String? uniqueKey) =>
      _postPregnantForumManager.clearRequest(uniqueKey);
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
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
