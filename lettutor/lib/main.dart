import 'package:flutter/material.dart';

void main() {
  runApp(const Lettutor());
}

class Lettutor extends StatelessWidget {
  const Lettutor({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lettutor',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      )
    );
  }
}

