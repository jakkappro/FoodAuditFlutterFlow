import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_User') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_User') ?? '{}';
          _User = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _FirstTimeOpened =
          await secureStorage.getBool('ff_FirstTimeOpened') ?? _FirstTimeOpened;
    });
    await _safeInitAsync(() async {
      _ScannedItems = (await secureStorage.getStringList('ff_ScannedItems'))
              ?.map((x) {
                try {
                  return ScannedItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ScannedItems;
    });
    await _safeInitAsync(() async {
      _IsGuest = await secureStorage.getBool('ff_IsGuest') ?? _IsGuest;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  UserStruct _User =
      UserStruct.fromSerializableMap(jsonDecode('{\"Intolerancies\":\"[]\"}'));
  UserStruct get User => _User;
  set User(UserStruct _value) {
    _User = _value;
    secureStorage.setString('ff_User', _value.serialize());
  }

  void deleteUser() {
    secureStorage.delete(key: 'ff_User');
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_User);
    secureStorage.setString('ff_User', _User.serialize());
  }

  bool _FirstTimeOpened = true;
  bool get FirstTimeOpened => _FirstTimeOpened;
  set FirstTimeOpened(bool _value) {
    _FirstTimeOpened = _value;
    secureStorage.setBool('ff_FirstTimeOpened', _value);
  }

  void deleteFirstTimeOpened() {
    secureStorage.delete(key: 'ff_FirstTimeOpened');
  }

  List<ScannedItemStruct> _ScannedItems = [
    ScannedItemStruct.fromSerializableMap(jsonDecode(
        '{\"EAN\":\"03216549\",\"LastScanned\":\"1689681622952\",\"IsFavourite\":\"true\",\"NumberOfScans\":\"1\"}')),
    ScannedItemStruct.fromSerializableMap(jsonDecode(
        '{\"EAN\":\"623598412\",\"LastScanned\":\"1689681639728\",\"IsFavourite\":\"true\",\"NumberOfScans\":\"36\"}'))
  ];
  List<ScannedItemStruct> get ScannedItems => _ScannedItems;
  set ScannedItems(List<ScannedItemStruct> _value) {
    _ScannedItems = _value;
    secureStorage.setStringList(
        'ff_ScannedItems', _value.map((x) => x.serialize()).toList());
  }

  void deleteScannedItems() {
    secureStorage.delete(key: 'ff_ScannedItems');
  }

  void addToScannedItems(ScannedItemStruct _value) {
    _ScannedItems.add(_value);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void removeFromScannedItems(ScannedItemStruct _value) {
    _ScannedItems.remove(_value);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromScannedItems(int _index) {
    _ScannedItems.removeAt(_index);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  void updateScannedItemsAtIndex(
    int _index,
    ScannedItemStruct Function(ScannedItemStruct) updateFn,
  ) {
    _ScannedItems[_index] = updateFn(_ScannedItems[_index]);
    secureStorage.setStringList(
        'ff_ScannedItems', _ScannedItems.map((x) => x.serialize()).toList());
  }

  bool _IsGuest = true;
  bool get IsGuest => _IsGuest;
  set IsGuest(bool _value) {
    _IsGuest = _value;
    secureStorage.setBool('ff_IsGuest', _value);
  }

  void deleteIsGuest() {
    secureStorage.delete(key: 'ff_IsGuest');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
