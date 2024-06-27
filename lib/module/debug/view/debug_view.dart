import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DebugView extends StatefulWidget {
  final BuildContext context;
  final bool visible;
  final Widget? child;
  const DebugView({
    Key? key,
    required this.context,
    required this.visible,
    this.child,
  }) : super(key: key);

  Widget build(context, DebugController controller) {
    controller.view = this;

    if (child == null) return Container();
    if (!visible) return Container();
    if (!kDebugMode) return Container();

    return Material(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                child ??
                    Container(
                      width: 0,
                      height: 0,
                    ),
                Positioned(
                  right: -8,
                  bottom: 100,
                  child: Container(
                    width: 30.0,
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 12.0,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        InkWell(
                          onTap: () => Get.to(HUIWidgetDemoView()),
                          child: const Icon(
                            Icons.widgets,
                            color: Colors.white,
                            size: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "token: $token",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<DebugView> createState() => DebugController();
}

class UserDataViewer extends StatefulWidget {
  const UserDataViewer({Key? key}) : super(key: key);

  @override
  State<UserDataViewer> createState() => UserDataViewerState();
}

refreshUserDataViewer() {
  UserDataViewerState.instance?.refresh();
}

class UserDataViewerState extends State<UserDataViewer> {
  static UserDataViewerState? instance;
  @override
  void initState() {
    super.initState();
    instance = this;

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${Random().nextInt(10000)}",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  "tokens: $token",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
