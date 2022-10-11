import 'dart:async';
import 'package:money_manager/model/userModel.dart';
import '../dio_client.dart';
import '../endpoint/endpoint.dart';

class UserApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  UserApi(this._dioClient);

  Future<UserModel> createUser(String name, String birth) async {
    var data = {"name": name, "dayOfBirth": birth};

    try {
      final res = await _dioClient.post(Endpoints.createUser, data: data);
      var map = Map<String, dynamic>.from(res);
      var response = UserModel.fromMap(map);
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
