import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants
{
  static void showErrorDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
            msg,
            style:const TextStyle(
              fontSize: 15 ,
              fontWeight: FontWeight.bold ,
            ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
