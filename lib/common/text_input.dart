import 'package:flutter/material.dart';

class AppTextInput extends StatefulWidget {
  final String title;
  final bool isError;
  final TextEditingController value;
  final String? Function(String?)? validate;

  const AppTextInput(
      {super.key,
      this.title = "",
      this.isError = false,
      required this.value,
      this.validate});

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.isError ? Colors.redAccent : Colors.white,
              width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.value,
        validator: (value) {
          if (widget.validate != null) {
            return widget.validate!(value);
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: widget.title,
            labelStyle: TextStyle(
                color: widget.isError ? Colors.redAccent : Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
