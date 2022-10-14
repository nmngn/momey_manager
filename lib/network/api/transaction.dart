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
      String title,
      String idUser,
      String description,
      String amount,
      String category,
      String dateTime,
      int isIncome) async {
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

  Future<List<TransactionModel>> getAllTransaction() async {
    try {
      final response = await _dioClient.get(Endpoints.getAllTransaction);
      var result =
          (response as List).map((e) => TransactionModel.fromMap(e)).toList();
      return result;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<TransactionModel>> getTransactionRangeDate(
      String sDay, String eDay) async {
    var param = {"sDay": sDay, "eDay": eDay};
    try {
      final response = await _dioClient.get(Endpoints.getTransactionRangeDate,
          queryParameters: param);
      var result =
          (response as List).map((e) => TransactionModel.fromMap(e)).toList();
      return result;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<TransactionModel> updateTransaction(
      String id,
      String title,
      String idUser,
      String description,
      String amount,
      String category,
      String dateTime,
      int isIncome) async {
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
