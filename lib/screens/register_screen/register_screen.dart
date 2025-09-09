import 'package:flutter/material.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              SizedBox(height: 150),
              Text(
                'Complete sus datos para el registro',
                style: TextStyle(
                  color: Color(0xff7C3EB9),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              PrimaryInput(labelText: 'Email', hintText: 'Ingresar email'),
              SizedBox(height: 16),
              PrimaryInput(
                labelText: 'Teléfono',
                hintText: 'Ingrese su numero de teléfono',
              ),
              SizedBox(height: 16),
              PrimaryInput(
                labelText: 'Contraseña',
                hintText: 'Ingresar contraseña',
              ),
              SizedBox(height: 16),
              PrimaryInput(
                labelText: 'Confirmar Contraseña',
                hintText: 'Ingresar nuevamente su contraseña',
              ),
              SizedBox(height: 32),
              PrimaryButton(label: 'Iniciar Sesión', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
