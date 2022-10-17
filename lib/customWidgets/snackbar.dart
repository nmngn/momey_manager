import 'package:flutter/material.dart';

snackBar({required BuildContext context, required String title, required int duration}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      duration: Duration(milliseconds: duration),
    ),
  );
}
