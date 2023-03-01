import 'package:flutter/material.dart';
import 'package:lettutor/constants/routes.dart';
import 'package:lettutor/views/authentication/login_view.dart';
import 'package:lettutor/views/authentication/register_view.dart';
import 'package:lettutor/views/authentication/forgot_password_view.dart';
import 'package:lettutor/pages/navigation_page.dart';
import 'package:lettutor/views/course_detail_view.dart';

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
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.blue),
        // primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.blue[600],
              letterSpacing: 1.1),
          displayMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            //letterSpacing: 1.0,
            color: Colors.blue[600],
          ),
          displaySmall: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyLarge: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
        ),
      ),
      home: const LoginView(),
      routes: {
        Routes.login: (context) => const LoginView(),
        Routes.register: (context) => const RegisterView(),
        Routes.forgotPassword: (context) => const ForgotPasswordView(),
        Routes.main: (context) => const NavigationPage(),
        Routes.courseDetail: (context) => const CourseDetailView(),
      }
    );
  }
}

