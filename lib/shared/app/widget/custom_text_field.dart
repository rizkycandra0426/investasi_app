import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class CustomTextField extends StatefulWidget {
  final String? value;
  final String? title;
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? iconForm;
  final Function(String) onChanged;
  CustomTextField({
    super.key,
    this.value,
    this.title,
    this.hintText,
    this.textEditingController,
    this.obscureText,
    this.suffixIcon,
    this.iconForm,
    required this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;
  updateVisiblility() {
    isPasswordVisible = !isPasswordVisible;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isPasswordVisible = widget.obscureText == true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? 'Change title',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: medium,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(
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
                widget.iconForm ?? 'assets/icons/icon_email.png',
                width: 16,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFormField(
                  initialValue: widget.value,
                  style: blackTextStyle.copyWith(),
                  obscureText: isPasswordVisible && widget.obscureText == true,
                  controller: widget.textEditingController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: widget.hintText ?? 'Change Hint Text',
                    hintStyle: greyTextStyle.copyWith(),
                    suffixIcon: widget.obscureText == null
                        ? null
                        : InkWell(
                            child: Icon(isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onTap: () => updateVisiblility(),
                          ),
                  ),
                  onChanged: (value) => widget.onChanged(value),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
