import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.errorText,
    this.obscureText = false,
  });

  final String labelText;
  final String? errorText;
  final Function(String)? onChanged;
  final TextInputType textInputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: textInputType,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black87,
          ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
