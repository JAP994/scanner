import 'package:flutter/material.dart';
import 'package:scanner/screens/home_screen/home_screen.dart';
import 'package:scanner/screens/register_screen/register_screen.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';
import 'package:scanner/widgets/secondary_button.dart';
import 'package:scanner/widgets/ternary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Llave global para el formulario
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  // String? emailValidor(String value) {
  //   if (!value.contains("@")) {
  //     return "No es un email válido";
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 75),
                Image.asset("assets/logo.png", width: 170),
                SizedBox(height: 120),
                PrimaryInput(
                  label: "Email",
                  hint: "Ingresa tu email",
                  customValidator: (value) {
                    if (!value!.contains("@")) {
                      return "No es un email válido";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print("VALOR email: $value");
                    _email = value;
                  },
                ),
                SizedBox(height: 16),
                PrimaryInput(
                  label: "Contraseña",
                  hint: "Ingresa tu contraseña",
                  customValidator: (value) {
                    if (value!.length <= 6) {
                      return "La contraseña debe tener 6 caracteres";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print("Valor contraseña: $value");
                    _password = value;
                  },
                ),
                SizedBox(height: 32),
                PrimaryButton(
                  label: "Iniciar Sesión",
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    print("ES VALIDO? : $isValid");
                    if (isValid) {
                      _formKey.currentState!.save();
                      print(
                        "Hacer login a : user: $_email contraseña: $_password",
                      );

                      /// llamada a un api externa o un servicio
                      // await Future.delayed(Duration(seconds: 2)).timeout(Duration(seconds: 1));
                      Navigator.pushReplacementNamed(
                        context,
                        HomeScreen.routeName,
                      );
                    }
                    // final route = MaterialPageRoute(
                    //   builder: (context) {
                    //     return HomeScreen();
                    //   },
                    // );
                    // Navigator.pushReplacement(context, route);
                    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  },
                ),
                SecondaryButton(
                  label: "He olvidado mi contraseña",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TernaryButton(
          label: "Registrarse",
          onPressed: () {
            /// Navegación
            /// 1. Push
            // final route = MaterialPageRoute(
            //   builder: (context) {
            //     return RegisterScreen();
            //   },
            // );

            // Navigator.push(context, route);
            Navigator.pushNamed(context, RegisterScreen.routeName);

            /// 2. Push Replacement
            /// 3. Push Until
          },
        ),
      ),
    );
  }
}
