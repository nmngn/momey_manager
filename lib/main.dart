import 'package:money_manager/network/service/service_locator.dart';
import 'package:money_manager/view/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/reportController.dart';
import 'controller/transactionController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/transDetailController.dart';
import 'view/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String result = "";

  void loadId() async {
    await setupLocator();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      result = prefs.getString('idUser') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadId();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ReportController()),
          ChangeNotifierProvider(create: (_) => TransactionController()),
          ChangeNotifierProvider(create: (_) => TransDetailController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: (() {
            if (result == '') {
              return RegisterScreen();
            } else {
              return Home();
            }
          }()),
        ));
  }
}
