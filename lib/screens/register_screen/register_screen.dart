import 'package:flutter/material.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = true;
  bool _showConfirmPassword = true;
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
              PrimaryInput(
                labelText: 'Email',
                hintText: 'Ingresar email',
                keyboardType: TextInputType.emailAddress,
              ),
              PrimaryInput(
                labelText: 'Teléfono',
                hintText: 'Ingrese su numero de teléfono',
                keyboardType: TextInputType.number,
              ),
              PrimaryInput(
                labelText: 'Contraseña',
                hintText: 'Ingresar contraseña',
                keyboardType: TextInputType.visiblePassword,
                obscureText: _showPassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    _showPassword = !_showPassword;
                    setState(() {});
                  },
                  child: Icon(Icons.remove_red_eye),
                ),
              ),
              PrimaryInput(
                labelText: 'Confirmar Contraseña',
                hintText: 'Ingresar nuevamente su contraseña',
                keyboardType: TextInputType.visiblePassword,
                obscureText: _showConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    _showConfirmPassword = !_showConfirmPassword;
                    setState(() {});
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
              PrimaryButton(label: 'Registrar Usuario', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
