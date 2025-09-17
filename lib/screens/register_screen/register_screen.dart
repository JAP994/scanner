import 'package:flutter/material.dart';
import 'package:scanner/screens/home_screen/home_screen.dart';
import 'package:scanner/widgets/primary_button.dart';
import 'package:scanner/widgets/primary_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String routeName = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();
  String? _password;
  String? _confirmPassword;
  String? _email;
  String? _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.0,
            children: [
              SizedBox(height: 125),
              Text(
                "Complete sus datos para registrarse:",
                style: TextStyle(
                  color: Color(0xff7C3EB9),
                  fontWeight: FontWeight.w500,
                ),
              ),
              PrimaryInput(
                label: "Email",
                hint: "Ingrese un email",
                keyboardType: TextInputType.emailAddress,
                customValidator: (value) {
                  if (!value!.contains("@")) {
                    //Regex
                    return "Ingresa un email válido";
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              PrimaryInput(
                label: "Teléfono",
                hint: "Ingrese un teléfono",
                keyboardType: TextInputType.phone,
                customValidator: (value) {
                  if (value!.length != 10) {
                    return "Ingresar un número válido";
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value;
                },
              ),
              PrimaryInput(
                label: "Contraseña",
                hint: "Ingrese una contraseña",
                keyboardType: TextInputType.visiblePassword,
                obscureText: _showPassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    print("Mostrar contraseña");
                    _showPassword = !_showPassword;
                    setState(() {});
                  },
                  child: Icon(Icons.remove_red_eye),
                ),
                customValidator: (value) {
                  if (value!.length <= 6) {
                    return "Debe ser mas de 6 caracteres";
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
                label: "Confirmar contraseña",
                hint: "Repite tu contraseña",
                keyboardType: TextInputType.visiblePassword,
                obscureText: _showPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    print("Mostrar contraseña 2");
                    _showPassword = !_showPassword;
                    setState(() {});
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
                onChanged: (value) {
                  _confirmPassword = value;
                },
                customValidator: (value) {
                  if (value!.length <= 6) {
                    return "Debe ser mas de 6 caracteres";
                  }
                  if (_password != _confirmPassword) {
                    return "Las contraseñas deben ser iguales";
                  }

                  return null;
                },
              ),
              PrimaryButton(
                label: "Registrarse",
                onPressed: () {
                  final _isValid = _formKey.currentState!.validate();
                  if (!_isValid) return; // Return temprano, Early return

                  _formKey.currentState!.save();

                  print("INFO:");
                  print(_email);
                  print(_phone);
                  print(_password);

                  // 1. Push
                  // final route = MaterialPageRoute(builder: (context){
                  //   return HomeScreen();
                  // });
                  // Navigator.pop(context); - No hacerlo
                  //Navigator.pushReplacement(context, route);
                  // Push and remove until
                  // Push - Login - Registro - HomeScreen
                  // Replacement - HomeScreen
                  // Remove Until HomeScreen
                  // Navigator.pushAndRemoveUntil(context, route, (_)=> false);
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
    );
  }
}
