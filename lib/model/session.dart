import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<void> setId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('idUser', id);
  }

  static Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('idUser');
    print("This is id" + data!);
    return Future.value(data);
  }

  static Future<void> setData(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);
  }

  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('username');
    print("This is name" + data!);
    return Future.value(data);
  }
}
