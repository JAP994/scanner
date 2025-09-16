import 'package:flutter/material.dart';
import 'package:scanner/screens/home_screen/home_screen.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  String? _password;
  String? _confirmPassword;
  String? _email;
  String? _phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
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
                PrimaryInput(
                  labelText: 'Email',
                  hintText: 'Ingresar email',
                  keyboardType: TextInputType.emailAddress,
                  customValidator: (value) {
                    if (!value!.contains("@")) {
                      return "Ingresa un email válido";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                PrimaryInput(
                  labelText: 'Teléfono',
                  hintText: 'Ingrese su número de teléfono',
                  keyboardType: TextInputType.number,
                  customValidator: (value) {
                    if (value!.length != 10) {
                      return 'Ingrwese un numero valido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value;
                  },
                ),
                PrimaryInput(
                  labelText: 'Contraseña',
                  hintText: 'Ingresar contraseña',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  customValidator: (value) {
                    if (value!.length <= 6) {
                      return 'Debe ser mas de 6 caracteres';
                    }
                    if (_password != _confirmPassword) {
                      return "Las contraseñas deben ser iguales";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
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
                  onChanged: (value) {
                    _confirmPassword = value;
                  },
                  onSaved: (value) {
                    _confirmPassword = value;
                  },
                  customValidator: (value) {
                    if (value!.length <= 6) {
                      return 'Debe ser mas de 6 caracteres';
                    }
                    if (_password != _confirmPassword) {
                      return "Las contraseñas deben ser iguales";
                    }
                    return null;
                  },
                ),
                PrimaryButton(
                  label: 'Registrarse',
                  onPress: () {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) return;

                    _formKey.currentState!.save();

                    debugPrint("Email: $_email");
                    debugPrint("Teléfono: $_phone");
                    debugPrint("Contraseña: $_password");

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
