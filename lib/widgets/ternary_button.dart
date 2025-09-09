import 'package:flutter/material.dart';

class TernaryButton extends StatelessWidget {
  const TernaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: Text(label, style: TextStyle(color: Color(0xff7C3EB9))),
      ),
    );
  }
}
