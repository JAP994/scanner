import 'package:flutter/material.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 125),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Text(
                'Complete sus datos para el registro',
                style: TextStyle(
                  color: Color(0xff7C3EB9),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              PrimaryInput(labelText: 'Email', hintText: 'Ingresar email'),
              PrimaryInput(
                labelText: 'Teléfono',
                hintText: 'Ingrese su numero de teléfono',
              ),
              PrimaryInput(
                labelText: 'Contraseña',
                hintText: 'Ingresar contraseña',
              ),
              PrimaryInput(
                labelText: 'Confirmar Contraseña',
                hintText: 'Ingresar nuevamente su contraseña',
              ),
              PrimaryButton(label: 'Registrar Usuario', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
