import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {
  const PrimaryInput({
    super.key,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.customValidator,
    this.onSaved,
    this.onChanged,
  });

  final String labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? customValidator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (value) {
        if (value == null) {
          return "Este parametro es requerido";
        }
        if (value.isEmpty) {
          return "No puede estar vacio";
        }
        return customValidator?.call(value);
      },
      onSaved: onSaved,
      onChanged: onChanged,
    );
  }
}
