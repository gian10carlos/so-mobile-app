import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputTextWidget extends StatelessWidget {
  final String hintText;
  final Color color;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;

  const CustomInputTextWidget(
      {super.key,
      required this.hintText,
      required this.color,
      this.suffixIcon,
      required this.obscureText,
      required this.keyboardType,
      this.controller,
      this.validator,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      suffixIcon: suffixIcon is Icon
          ? Icon(
              (suffixIcon as Icon).icon,
              color: color,
            )
          : suffixIcon,
      hintText: hintText,
      hintStyle: TextStyle(color: color),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
          width: 1.5,
        ),
      ),
    );

    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      decoration: inputDecoration,
      style: TextStyle(color: color),
      cursorColor: color,
    );
  }
}
