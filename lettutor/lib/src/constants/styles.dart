import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.pink,
  textTheme: const TextTheme(

    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.pink,
      letterSpacing: 1.1
    ),

    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
      color: Colors.pink,
    ),

    displaySmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
  ),
);
