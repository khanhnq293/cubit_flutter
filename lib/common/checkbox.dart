import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  final bool isChecked;
  final VoidCallback onChanged;

  const AppCheckBox(
      {super.key, this.isChecked = false, required this.onChanged});

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: Color(0xFF80CBC4), width: 2),
        value: widget.isChecked,
        fillColor: MaterialStateColor.resolveWith((states) =>
            widget.isChecked ? const Color(0xFF80CBC4) : Colors.white),
        onChanged: (value) {
          widget.onChanged.call();
        });
  }
}
