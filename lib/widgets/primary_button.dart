// FILLED BUTTON -> COLOR DE RELLENO
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, required this.onPress});
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color(0xff7C3EB9)),
        ),
        child: Text(label),
      ),
    );
  }
}
