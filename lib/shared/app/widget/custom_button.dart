import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function? onPressed;
  final Color? bgColor;
  const CustomButton({
    super.key,
    this.title,
    this.onPressed,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed!();
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        backgroundColor: bgColor ?? const Color(0xFF00AEE0),
      ),
      child: Text(
        title ?? 'Change Text Button',
        style: whiteTextStyle.copyWith(
          fontWeight: medium,
        ),
      ),
    );
  }
}
