import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String message, String title,
    Function? onOk, String? icon) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (icon != null)
                Image.asset(
                  icon,
                  width: 64.0,
                  height: 64.0,
                ),
              SizedBox(height: 16.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(message),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                onOk?.call();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
