import 'package:flutter/material.dart';
import 'package:scanner/screens/details_screen/details_screen.dart';
import 'package:scanner/screens/home_screen/home_screen.dart';
import 'package:scanner/screens/login_screen/login_screen.dart';
import 'package:scanner/screens/register_screen/register_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // home: LoginScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        // Replicar para las otras routas
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
