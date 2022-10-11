import 'dart:async';
import 'package:money_manager/model/transactionModel.dart';
import '../dio_client.dart';
import '../endpoint/endpoint.dart';

class TransactionApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  TransactionApi(this._dioClient);

  Future<TransactionModel> createTransaction(
      String idUser,
      String title,
      String description,
      String amount,
      int isIncome,
      String category,
      String dateTime) async {
    var data = {
      "idUser": idUser,
      "title": title,
      "description": description,
      "amount": amount,
      "isIncome": isIncome,
      "category": category,
      "dateTime": dateTime
    };

    try {
      final res =
          await _dioClient.post(Endpoints.createTransaction, data: data);
      var map = Map<String, dynamic>.from(res);
      var response = TransactionModel.fromMap(map);
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }


  Future<TransactionModel> getOneTransaction(String id) async {
    var data = {"id": id};

    try {
      final res = await _dioClient.get(Endpoints.getOneTransaction,
          queryParameters: data);
      var map = Map<String, dynamic>.from(res);
      var response = TransactionModel.fromMap(map);
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

    Future<TransactionModel> deleteTransaction(String id) async {
    var data = {"id": id};

    try {
      final res = await _dioClient.get(Endpoints.deleteTransaction,
          queryParameters: data);
      var map = Map<String, dynamic>.from(res);
      var response = TransactionModel.fromMap(map);
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }


  Future<TransactionModel> getAllTransaction() async {
    try {
      final res = await _dioClient.get(Endpoints.getAllTransaction);
      var map = Map<String, dynamic>.from(res);
      var response = TransactionModel.fromMap(map);
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<TransactionModel> updateTransaction(
      String id,
      String title,
      String description,
      String amount,
      int isIncome,
      String category,
      String dateTime) async {
    var param = ({"id": id});
    var data = {
      "title": title,
      "description": description,
      "amount": amount,
      "isIncome": isIncome,
      "category": category,
      "dateTime": dateTime
    };

    try {
      final res = await _dioClient.put(Endpoints.getAllTransaction,
          queryParameters: param, data: data);
      var map = Map<String, dynamic>.from(res);
      var response = TransactionModel.fromMap(map);
      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

}