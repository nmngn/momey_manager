import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterClass createState() => _RegisterClass();
}

class _RegisterClass extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  String dateTime = '';

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width - 32 * 2,
            margin: const EdgeInsets.only(left: 32, right: 32),
            child: TextField(
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
          Container(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(1969, 1, 1),
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  dateTime =
                      DateFormat('yyyy-MM-dd – kk:mm').format(newDateTime);
                });
                // Do something
              },
            ),
          ),
          Container(
            width: width - 32 * 2,
            margin: const EdgeInsets.only(left: 32, right: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue
            ),
            child: MaterialButton(
              child: const Text("Xác nhận"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
