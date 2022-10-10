import 'package:shared_preferences/shared_preferences.dart';

Future<void> setId(String id) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('idUser', id);
}

Future<String> getId() async {
  final prefs = await SharedPreferences.getInstance();
  final String? data = prefs.getString('idUser');
  return Future.value(data);
}

