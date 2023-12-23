import 'package:flutter/material.dart';
import 'package:hyper_ui/module/authentication/widget/theme.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? iconForm;
  const CustomTextField({
    super.key,
    this.title,
    this.hintText,
    this.textEditingController,
    this.obscureText,
    this.suffixIcon,
    this.iconForm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? 'Change title',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            border: Border.all(
              color: fieldColor,
            ),
          ),
          child: Row(
            children: [
              // Icon(Icons.email),
              Image.asset(
                iconForm ?? 'assets/icons/icon_email.png',
                width: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  style: blackTextStyle.copyWith(),
                  obscureText: obscureText ?? false,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText ?? 'Change Hint Text',
                    hintStyle: greyTextStyle.copyWith(),
                    suffixIcon: suffixIcon ?? const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
