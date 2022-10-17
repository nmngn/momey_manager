import 'package:money_manager/constFiles/colors.dart';
import 'package:money_manager/controller/transDetailController.dart';
import 'package:money_manager/customWidgets/textButton.dart';
import 'package:money_manager/view/transactionDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homeScreen.dart';
import 'reportScreen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransDetailController transDetailController =
        Provider.of<TransDetailController>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomTextButton(
                text: "Home",
                textColor: transDetailController.buttonSelected
                    ? selectedTextButton
                    : nonSelectedTextButton,
                splash: false,
                press: () {
                  if (!transDetailController.buttonSelected) {
                    transDetailController.changeHomeNdReportSection(true);
                  }
                },
              ),
              const SizedBox(width: 10.0),
              CustomTextButton(
                text: "Report",
                textColor: transDetailController.buttonSelected
                    ? nonSelectedTextButton
                    : selectedTextButton,
                splash: false,
                press: () {
                  if (transDetailController.buttonSelected) {
                    transDetailController.changeHomeNdReportSection(false);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          transDetailController.toTransactionDetail(isSaved: false);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => TransactionDetail()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: transDetailController.buttonSelected
              ? HomeScreen()
              : ReportScreen(),
        ),
      ),
    );
  }
}
