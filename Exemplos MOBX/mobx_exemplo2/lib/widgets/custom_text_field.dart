import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.hint,
      this.prefix,
      this.suffix,
      required this.obscure,
      required this.textInputType,
      required this.onChanged,
      required this.enable});

  final TextEditingController? controller;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color.fromARGB(255, 212, 212, 212),
          borderRadius: BorderRadius.circular(32)),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        enabled: enable,
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            prefixIcon: prefix,
            suffixIcon: suffix),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
