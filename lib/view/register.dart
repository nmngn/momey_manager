import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/model/session.dart';
import 'package:money_manager/network/api/user.dart';
import 'package:money_manager/view/home.dart';
import '../network/dio_client.dart';
import '../network/service/service_locator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterClass createState() => _RegisterClass();
}

class _RegisterClass extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  String dateTime = '';
  late UserApi repo;

  @override
  void initState() {
    super.initState();
    repo = UserApi(getIt<DioClient>());
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double navigationBarHeight = MediaQuery.of(context).padding.bottom;
    print(navigationBarHeight);
    double spacing = (height - navigationBarHeight - 304) / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 56,
            width: width - 32 * 2,
            margin: EdgeInsets.only(left: 32, right: 32, top: spacing - 16),
            child: TextField(
              controller: nameController,
              autofocus: true,
              autocorrect: false,
              style: const TextStyle(fontSize: 15.0, color: Colors.black),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Type your name',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(1989, 1, 1),
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  dateTime = DateFormat('yyyy-MM-dd').format(newDateTime);
                });
              },
            ),
          ),
          SizedBox(
            height: spacing - 92,
          ),
          Container(
            width: width - 32 * 2,
            height: 48,
            margin: const EdgeInsets.only(left: 32, right: 32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue),
            child: MaterialButton(
              child: const Text("Xác nhận"),
              onPressed: () {
                if (dateTime == "") {
                  dateTime = "1989-01-01";
                }
                var data = repo.createUser(nameController.text, dateTime);
                Session.setData(nameController.text);
                Session.setId(data.then((value) {
                  return value.idUser;
                }).toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home()));
              },
            ),
          )
        ],
      ),
    );
  }
}
