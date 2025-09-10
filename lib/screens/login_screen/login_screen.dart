import 'package:flutter/material.dart';
import 'package:scanner/screens/home_screen/home_screen.dart';
import 'package:scanner/screens/register_screen/register_screen.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';
import 'package:scanner/widgets/secondary_button.dart';
import 'package:scanner/widgets/ternary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = true;

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
              PrimaryInput(
                labelText: 'Email',
                hintText: 'Ingresar email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PrimaryInput(
                labelText: 'Contraseña',
                hintText: 'Ingresar contraseña',
                keyboardType: TextInputType.visiblePassword,
                obscureText: _showPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    _showPassword = !_showPassword;
                    setState(() {});
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
              SizedBox(height: 32),
              PrimaryButton(
                label: 'Iniciar Sesión',
                onPress: () {
                  final route = MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  );
                  Navigator.pushReplacement(context, route);
                },
              ),
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
        child: TernaryButton(
          label: 'Registrarse',
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (context) {
                return RegisterScreen();
              },
            );
            Navigator.push(context, route);
          },
        ),
      ),
    );
  }
}
