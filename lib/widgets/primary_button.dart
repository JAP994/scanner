// Filled Button -> Color de relleno
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  /// Constructor
  const PrimaryButton({
    super.key,
    required this.label, 
    required this.onPressed,
  });

  /// Parámetros
  final String label;

  // Vacío -> void Function -> VoidCallback
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton( //TextButton
        onPressed: () {
          // Ejecutar lo que necesiten
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color(0xff7C3EB9))
        ),
        child: Text(label),
      ),
    );
  }
}
