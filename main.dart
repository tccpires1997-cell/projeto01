import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryBlue = Color(0xFF1565C0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      theme: ThemeData(
        primaryColor: primaryBlue,
        scaffoldBackgroundColor: Color(0xFFF4F8FB),
        fontFamily: 'Arial',
        appBarTheme: AppBarTheme(
          backgroundColor: primaryBlue,
          elevation: 0,
        ),
      ),
      home: LoginScreen(),
    );
  }
}