import 'package:money_manager/constFiles/colors.dart';
import 'package:money_manager/constFiles/dateConvert.dart';
import 'package:money_manager/constFiles/strings.dart';
import 'package:money_manager/controller/transDetailController.dart';
import 'package:money_manager/controller/transactionController.dart';
import 'package:money_manager/model/transactionModel.dart';
import 'package:money_manager/view/transactionDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentTransList extends StatelessWidget {
  const RecentTransList({
    Key? key,
    required this.transController,
    required this.transDetailController,
  }) : super(key: key);

  final TransactionController transController;
  final TransDetailController transDetailController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: transController.newList.isEmpty
          ? const Center(child: Text("No Records"))
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                if (transController.newList.length > index) {
                  TransactionModel? data =
                      transController.newList[index];

                  String amountSign = data!.isIncome == true ? "+" : "-";
                  Color amountColor =
                      data.isIncome == true ? incomeGreen : expenseRed;

                  return ListTile(
                    onTap: () {
                      transDetailController.toTransactionDetail(
                          isSaved: true,
                          id: data.id,
                          title: data.title,
                          description: data.description,
                          amount: data.amount,
                          department: data.category,
                          isIncome: data.isIncome == true ? true : false,
                          dateTime: data.dateTime);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TransactionDetail()),
                      );
                    },
                    title: Text(data.title ?? ""),
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: Container(
                      height: 50.0,
                      width: 50.0,
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          color: whiteColor,
                          boxShadow: [BoxShadow(color: Colors.transparent)],
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: SvgPicture.asset(
                        transController.tileIcon(data.category ?? others),
                        height: 35.0,
                        color: svgColor,
                      ),
                    ),
                    subtitle: Text(dateConverter(DateTime.parse(
                        data.dateTime ?? "2000-01-1 00:00:00.000"))),
                    trailing: Text(
                      "$amountSign${data.amount}",
                      style: TextStyle(color: amountColor),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
    );
  }
}
