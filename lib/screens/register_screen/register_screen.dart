import 'package:flutter/material.dart';
import 'package:scanner/screens/home_screen/home_screen.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
              const SizedBox(height: 125),
              const Text(
                'Complete sus datos para el registro',
                style: TextStyle(
                  color: Color(0xff7C3EB9),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const PrimaryInput(
                labelText: 'Email',
                hintText: 'Ingresar email',
                keyboardType: TextInputType.emailAddress,
              ),
              const PrimaryInput(
                labelText: 'Teléfono',
                hintText: 'Ingrese su número de teléfono',
                keyboardType: TextInputType.number,
              ),
              PrimaryInput(
                labelText: 'Contraseña',
                hintText: 'Ingresar contraseña',
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              PrimaryInput(
                labelText: 'Confirmar Contraseña',
                hintText: 'Ingresar nuevamente su contraseña',
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
              PrimaryButton(
                label: 'Registrarse',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
