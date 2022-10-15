import 'dart:ffi';

import 'package:money_manager/constFiles/strings.dart';
import 'package:money_manager/model/transactionModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_manager/network/api/transaction.dart';
import '../network/dio_client.dart';
import '../network/service/service_locator.dart';

class TransactionController with ChangeNotifier {
  List<TransactionModel?> transactionList = [];

  double totalIncome = 0.0;
  double totalExpense = 0.0;
  double total = 0.0;

  bool fetching = false;
  late TransactionApi repo;

  TransactionController() {
    repo = TransactionApi(getIt<DioClient>());
    fetchTransaction();
  }

  void fetchTransaction() async {
    fetching = true;
    transactionList = [];
    totalIncome = 0.0;
    totalExpense = 0.0;
    total = 0.0;

    transactionList = await repo.getAllTransaction();

    for (var element in transactionList) {
      if (element!.isIncome == true) {
        totalIncome += double.parse(element.amount ?? "0.0");
      } else {
        totalExpense += double.parse(element.amount ?? "0.0");
      }
    }

    total = totalIncome - totalExpense;

    fetching = false;

    notifyListeners();
  }

  void insertTransaction(
          String title,
          String idUser,
          String description,
          String amount,
          String category,
          String dateTime,
          bool isIncome) async =>
      await repo
          .createTransaction(
              title, idUser, description, amount, category, dateTime, isIncome)
          .catchError((onError) => print("Insertion On Error: $onError"));

  void updateTransaction(
          String title,
          String description,
          String amount,
          String category,
          String dateTime,
          bool isIncome,
          String id) async =>
      await repo
          .updateTransaction(id, title, description, amount, category,
              dateTime, isIncome)
          .catchError((onError) => print("Update On Error: $onError"));

  void deleteTransaction(String id) async => await repo
      .deleteTransaction(id)
      .catchError((onError) => print("Deletion On Error: $onError"));

  String tileIcon(String departmentName) {
    if (departmentName == health) return svgPath(healthSvg);
    if (departmentName == family) return svgPath(familySvg);
    if (departmentName == shopping) return svgPath(shoppingSvg);
    if (departmentName == food) return svgPath(foodSvg);
    if (departmentName == vehicle) return svgPath(vehicleSvg);
    if (departmentName == salon) return svgPath(salonSvg);
    if (departmentName == devices) return svgPath(devicesSvg);
    if (departmentName == office) return svgPath(officeSvg);
    return svgPath(othersSvg);
  }
}
