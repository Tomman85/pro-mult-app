import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.callback,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    super.key,
  });

  final String title;
  final VoidCallback callback;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: callback,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? const Color(0xFF0567AB),
            borderRadius: BorderRadius.circular(90),
            border: Border.all(
              color: borderColor ?? Colors.white,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Heebo',
              color: textColor ?? Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

