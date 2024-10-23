import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hyper_ui/core.dart';

class DebugUserView extends StatefulWidget {
  const DebugUserView({super.key});

  Widget build(context, DebugUserController controller) {
    controller.view = this;
    List values = [
      {
        "label": "User ID",
        "value": currentUser?.userId,
      },
      {
        "label": "Token",
        "value": token,
      },
      {
        "label": "FCM Token",
        "value": fcmToken,
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debug User"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QButton(
                    label: "Test Notifications (Send to all users)",
                    size: xs,
                    onPressed: () async {
                      dio.get(
                        "$baseUrl/send-notifications/testing",
                        options: Options(
                          headers: {
                            "Content-Type": "application/json",
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: values.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = values[index];
                return ListTile(
                  title: Text(item["label"]),
                  subtitle: InkWell(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: item["value"].toString()));
                      ss("Copied to clipboard");
                    },
                    child: Text(item["value"].toString()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DebugUserView> createState() => DebugUserController();
}
