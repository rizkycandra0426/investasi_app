import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

Widget QDismissible({
  required Function onDismiss,
  required Widget child,
}) {
  return Dismissible(
    key: UniqueKey(),
    onDismissed: (detail) => onDismiss(),
    confirmDismiss: (direction) async {
      bool confirm = false;
      await showDialog<void>(
        context: Get.currentContext,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu yakin ingin menghapus data?'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  confirm = true;
                  Navigator.pop(context);
                },
                child: const Text("Yes"),
              ),
            ],
          );
        },
      );
      if (confirm) {
        onDismiss();
        return Future.value(true);
      }
      return Future.value(false);
    },
    child: child,
  );
}
