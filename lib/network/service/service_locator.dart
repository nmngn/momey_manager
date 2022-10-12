import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:money_manager/network/api/transaction.dart';
import 'package:money_manager/network/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dio_client.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton(SharedPreferences);
  getIt.registerSingleton<DioClient>(DioClient(Dio()));
}
