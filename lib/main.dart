import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF141414),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: Color(0xFFC53030),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xFF4E4B66),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF6E7191),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: Color(0xFF141414),
            fontWeight: FontWeight.w400,
          ),
          displaySmall: TextStyle(
            fontSize: 12,
            color: Color(0xFF363636),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
