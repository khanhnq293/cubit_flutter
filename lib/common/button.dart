import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String title;
  final VoidCallback? onPress;

  const AppButton(
      {super.key,
      this.title = '',
      required this.onPress});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.onPress != null
                  ? [const Color(0xFF1DE9B6), const Color(0xFF00BFA5)]
                  : [const Color(0xFF00796B), const Color(0xFF004D40)])),
      child: TextButton(
          onPressed: widget.onPress,
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
