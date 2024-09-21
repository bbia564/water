import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class HWLocalTool {
  static HWLocalTool? _singleton;
  static SharedPreferences? _store;

  static Future<HWLocalTool?> initialize() async {
    if (_singleton == null) {
      if (_singleton == null) {
        var singleton = HWLocalTool._();
        await singleton._init();
        _singleton = singleton;
      }
    }
    return _singleton;
  }

  HWLocalTool._();

  Future _init() async {
    _store = await SharedPreferences.getInstance();
  }

  static Future<bool>? putObject(String key, Object value) {
    return _store?.setString(key, json.encode(value));
  }

  static T? getObj<T>(String key, T Function(Map v) f, {T? defValue}) {
    Map? map = getObject(key);
    return map == null ? defValue : f(map);
  }

  
  static Map? getObject(String key) {
    String? data = _store?.getString(key);
    return (data == null || data.isEmpty) ? null : json.decode(data);
  }


  static Future<bool>? putObjectList(String key, List<Object> list) {
    List<String>? dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return _store?.setStringList(key, dataList);
  }

  static List<T>? getObjList<T>(String key, T Function(Map v) f,
      {List<T>? defValue = const []}) {
    List<Map>? dataList = getObjectList(key);
    List<T>? list = dataList?.map((value) {
      return f(value);
    }).toList();
    return list ?? defValue;
  }

  static List<Map>? getObjectList(String key) {
    List<String>? dataLis = _store?.getStringList(key);
    return dataLis?.map((value) {
      Map dataMap = json.decode(value);
      return dataMap;
    }).toList();
  }

  
  static String? getString(String key, {String? defValue = ''}) {
    return _store?.getString(key) ?? defValue;
  }


  static Future<bool>? putString(String key, String value) {
    return _store?.setString(key, value);
  }

  /// get bool.
  static bool? getBool(String key, {bool? defValue = false}) {
    return _store?.getBool(key) ?? defValue;
  }

  /// put bool.
  static Future<bool>? putBool(String key, bool value) {
    return _store?.setBool(key, value);
  }

  
  static int? getInt(String key, {int? defValue = 0}) {
    return _store?.getInt(key) ?? defValue;
  }

  
  static Future<bool>? putInt(String key, int value) {
    return _store?.setInt(key, value);
  }

  /// get double.
  static double? getDouble(String key, {double? defValue = 0.0}) {
    return _store?.getDouble(key) ?? defValue;
  }

  /// put double.
  static Future<bool>? putDouble(String key, double value) {
    return _store?.setDouble(key, value);
  }

  /// get string list.
  static List<String>? getStringList(String key,
      {List<String>? defValue = const []}) {
    return _store?.getStringList(key) ?? defValue;
  }

  /// put string list.
  static Future<bool>? putStringList(String key, List<String> value) {
    return _store?.setStringList(key, value);
  }

  /// get dynamic.
  static dynamic getDynamic(String key, {Object? defValue}) {
    return _store?.get(key) ?? defValue;
  }

  /// have key.
  static bool? haveKey(String key) {
    return _store?.getKeys().contains(key);
  }

  /// contains Key.
  static bool? containsKey(String key) {
    return _store?.containsKey(key);
  }

  /// get keys.
  static Set<String>? getKeys() {
    return _store?.getKeys();
  }

  /// remove.
  static Future<bool>? remove(String key) {
    return _store?.remove(key);
  }

  /// clear.
  static Future<bool>? clear() {
    return _store?.clear();
  }

  /// Fetches the latest values from the host platform.
  static Future<void>? reload() {
    return _store?.reload();
  }

  ///Sp is initialized.
  static bool isInitialized() {
    return _store != null;
  }

  /// get Sp.
  static SharedPreferences? getSp() {
    return _store;
  }
}