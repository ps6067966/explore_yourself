import 'package:flutter/material.dart';

class CustomTextButtonForOnboarding extends StatelessWidget {
  const CustomTextButtonForOnboarding({
    Key? key, 
    required this.btnName, 
    required this.onPressedCallback, 
    required this.bgColor,
  }) : super(key: key);
  final String btnName;
  final VoidCallback onPressedCallback;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(btnName),
      onPressed: onPressedCallback,
      style: TextButton.styleFrom(backgroundColor: bgColor),
    );
  }
}
