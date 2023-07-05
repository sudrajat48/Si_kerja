import 'package:flutter/material.dart';
import 'package:si_kerja/pages/home.dart';
import 'package:si_kerja/pages/login.dart';
import 'package:si_kerja/pages/register.dart';
import 'package:si_kerja/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Si Kerja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplahsScreen(),
      routes: {
        'register': (context) => const RegisterPage(),
        'home': (context) => const HomePage(),
        'login': (context) => const LoginPage(),
      },
    );
  }
}
