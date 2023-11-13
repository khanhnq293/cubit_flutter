import 'package:flutter/material.dart';

class AppTextInputPass extends StatefulWidget {
  final String title;
  final bool isError;
  final TextEditingController value;
  final VoidCallback? valueChange;

  const AppTextInputPass(
      {super.key,
      this.title = "",
      this.isError = false,
      required this.value,
      this.valueChange});

  @override
  State<AppTextInputPass> createState() => _AppTextInputPassState();
}

class _AppTextInputPassState extends State<AppTextInputPass> {
  bool isVisibility = false;

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
      child: TextField(
        controller: widget.value,
        onChanged: (value) => widget.valueChange?.call(),
        obscureText: !isVisibility,
        decoration: InputDecoration(
            labelText: widget.title,
            labelStyle: TextStyle(
                color: widget.isError ? Colors.redAccent : Colors.grey),
            border: InputBorder.none,
            suffixIcon: InkWell(
                child: isVisibility
                    ? Icon(
                        Icons.visibility,
                        color: widget.isError ? Colors.redAccent : Colors.grey,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: widget.isError ? Colors.redAccent : Colors.grey,
                      ),
                onTap: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                })),
      ),
    );
  }
}
