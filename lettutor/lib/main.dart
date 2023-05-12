import 'dart:io';
import 'package:lettutor/src/providers/app_provider.dart';
import 'package:lettutor/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:lettutor/src/constants/routes.dart';

import 'package:lettutor/src/features/authentication/forgot_password_view.dart';
import 'package:lettutor/src/features/authentication/login_view.dart';
import 'package:lettutor/src/features/authentication/register_view.dart';

import 'package:lettutor/src/pages/navigation_page.dart';
import 'package:lettutor/src/views/course_detail_view.dart';
import 'package:lettutor/src/views/become_tutor_view.dart';
import 'package:lettutor/src/views/booking_detail_view.dart';
import 'package:lettutor/src/views/teacher_detail_view.dart';
import 'package:lettutor/src/views/tutor_review_view.dart';
import 'package:lettutor/src/views/user_profile_view.dart';
import 'package:lettutor/src/views/video_call_view.dart';
import 'package:lettutor/src/views/write_review_view.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const LetTutor());
}

class LetTutor extends StatelessWidget {
  const LetTutor({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'LetTutor',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.light().copyWith(primary: Colors.pink),
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
              displayLarge: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[600],
                  letterSpacing: 1.1),
              displayMedium: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.pink[600],
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
            Routes.becomeTutor: (context) => const BecomeTutorView(),
            Routes.userProfile: (context) => const UserProfileView(),
            Routes.courseDetail: (context) => const CourseDetailView(),
            Routes.teacherDetail: (context) => const TutorDetailView(),
            Routes.review: (context) => const TutorFeedbackView(),
            Routes.writeReview: (context) => const WriteReviewView(),
            Routes.tutorSearchResult: (context) => const TutorSearchResult(),
          }
      )
    );

  }
}

