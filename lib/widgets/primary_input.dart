import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {
  const PrimaryInput({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.customValidator,
    this.onSaved,
    this.onChanged,
  });

  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? customValidator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    // Validación
    // Guardado
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (value) {
        // Validar que exista
        if (value == null) {
          return "Este parametro es requerido";
        }
        if (value.isEmpty) {
          return "No puede estar vacío";
        }

        // final validator = customValidator?.call(value);
        // return validator;

        return customValidator?.call(value);
      },

      onSaved: onSaved,
      onChanged: onChanged,
    );
  }
}
