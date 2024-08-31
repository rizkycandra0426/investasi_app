// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';

class SimpleTabbarItem {
  final String label;
  final IconData icon;
  final Widget view;
  SimpleTabbarItem({
    required this.label,
    required this.icon,
    required this.view,
  });
}

class SimpleTabbar extends StatefulWidget {
  final List<SimpleTabbarItem> items;
  const SimpleTabbar({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<SimpleTabbar> createState() => _SimpleTabbarState();
}

class _SimpleTabbarState extends State<SimpleTabbar> {
  late Widget view = widget.items.first.view;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(widget.items.length, (index) {
                        var item = widget.items[index];
                        bool selected = view == item.view;
                        return Container(
                          height: 38,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              view = item.view;
                              setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 600),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 6.0,
                              ),
                              decoration: BoxDecoration(
                                color: selected ? Colors.black : Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  //if can back?
                                  Icon(
                                    item.icon,
                                    size: 16,
                                    color: selected ? Colors.white : null,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    "${item.label}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: selected ? Colors.white : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      size: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
          Expanded(
            child: view,
          ),
        ],
      ),
    );
  }
}
