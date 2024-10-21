import 'package:flutter/material.dart';
import 'package:so_mobile_app/presentation/widgets/input_text_widget.dart';

class CustomInputPasswordWidget extends StatefulWidget {
  final Color color;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomInputPasswordWidget(
      {super.key,
      required this.color,
      required this.hintText,
      this.controller,
      this.validator});

  @override
  State<CustomInputPasswordWidget> createState() =>
      _CustomInputPasswordWidgetState();
}

class _CustomInputPasswordWidgetState extends State<CustomInputPasswordWidget> {
  bool _obscureText = true;

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomInputTextWidget(
      keyboardType: TextInputType.text,
      hintText: widget.hintText,
      color: widget.color,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: widget.color,
        ),
        onPressed: _togglePasswordView,
      ),
    );
  }
}
