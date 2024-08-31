// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TopBar extends StatelessWidget {
  final List<Widget> children;
  const TopBar({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      color: Colors.grey[800],
      child: Row(
        children: List.generate(children.length, (index) {
          return children[index];
        }),
      ),
    )
        .animate()
        .fadeIn(
          duration: 600.ms,
        )
        .shimmer(
          duration: 1200.ms,
        );
  }
}
