import 'dart:io';
import 'package:money_manager/constFiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/model/session.dart';

class UserProfileCard extends StatefulWidget {
  @override
  _UserProfileCard createState() => _UserProfileCard();
}

class _UserProfileCard extends State<UserProfileCard> {
  static File? imageFile;
  String userName = "";

  @override
  void initState() {
    super.initState();
    Session.getUsername().then((String value) {
      setState(() {
        userName = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.0,
          width: 50.0,
          decoration: const BoxDecoration(
              color: profileContainer,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: imageFile == null
              ? const Icon(Icons.person, size: 35, color: profileBG)
              : Image.file(imageFile!, fit: BoxFit.contain),
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style:
                      TextStyle(color: greyText, fontWeight: FontWeight.bold),
                ),
                Text(
                  userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
