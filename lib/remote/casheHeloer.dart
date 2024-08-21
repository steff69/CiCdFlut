import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {
  static late SharedPreferences SharedPreferencess;

  static init() async {
    SharedPreferencess = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(
      {required String key, required bool value}) async {
   
    return await SharedPreferencess.setBool(key, value);
  }

  static dynamic getData({required String key}) {
    return SharedPreferencess.get(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await SharedPreferencess.setString(key, value);
    if (value is int) return await SharedPreferencess.setInt(key, value);
    if (value is bool) return await SharedPreferencess.setBool(key, value);
    return await SharedPreferencess.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    return await SharedPreferencess.remove(key);
  }
}
//thesha kima local storge (ken nsit)