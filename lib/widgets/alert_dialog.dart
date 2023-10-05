import 'package:flutter/material.dart';

class MyAlertDilaog {
  static void showMyDialog({
    required BuildContext context,
    required String title,
    required String subTitle,
    required Function() tabNo,
    required Function() tabYes,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        clipBehavior: Clip.antiAlias,
        scrollable: false,
        title: Text(title),
        content: Text(subTitle),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey.shade200),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: tabNo,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: const Text("No"),
                ),
              ),
              TextButton(
                onPressed: tabYes,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: const Text("Yes", style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
