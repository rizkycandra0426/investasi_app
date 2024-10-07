// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class Popfield extends StatefulWidget {
  final String title;
  final String label;
  final String value;
  final Function(String) onChanged;
  const Popfield({
    Key? key,
    required this.title,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<Popfield> createState() => _PopfieldState();
}

class _PopfieldState extends State<Popfield> {
  String currentValue = "";
  @override
  void initState() {
    super.initState();
    currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QNumberField(
                label: widget.label,
                validator: Validator.required,
                value: currentValue,
                onChanged: (value) {
                  currentValue = value;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () {
          widget.onChanged(currentValue);
          Get.back();
        },
      ),
    );
  }
}
