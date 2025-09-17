import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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
      child: TextButton(
        //TextButton
        onPressed: () {
          // Ejecutar lo que necesiten
          onPressed();
        },
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          // textStyle: WidgetStateProperty.resolveWith((state) {
          //   if(state.contains(WidgetState.pressed)) {
          //     return TextStyle(fontSize: 18);
          //   }
          //   return TextStyle(fontWeight: FontWeight.bold);
          // },
          // ),
        ),
        child: Text(label),
      ),
    );
  }
}
