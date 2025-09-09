import 'package:flutter/material.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';
import 'package:scanner/widgets/secondary_button.dart';
import 'package:scanner/widgets/ternary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset('assets/logo.png', width: 170),
              SizedBox(height: 120),
              PrimaryInput(labelText: 'Email', hintText: 'Ingresar email'),
              SizedBox(height: 16),
              PrimaryInput(
                labelText: 'Contraseña',
                hintText: 'Ingresar contraseña',
              ),
              SizedBox(height: 32),
              PrimaryButton(label: 'Iniciar Sesión', onPress: () {}),
              SecondaryButton(
                label: 'Ha olvidado su contraseña',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TernaryButton(label: 'Registrarse', onPressed: () {}),
      ),
    );
  }
}
