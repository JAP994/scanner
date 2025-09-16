import 'package:flutter/material.dart';
import 'package:scanner/screens/home_screen/home_screen.dart';
import 'package:scanner/screens/login_screen/login_screen.dart';
import 'package:scanner/screens/register_screen/register_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCANNER APP',
      home: LoginScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
