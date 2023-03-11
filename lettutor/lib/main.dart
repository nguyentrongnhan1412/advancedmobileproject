import 'package:flutter/material.dart';
import 'package:lettutor/constants/routes.dart';
import 'package:lettutor/views/authentication/login_view.dart';
import 'package:lettutor/views/authentication/register_view.dart';
import 'package:lettutor/views/authentication/forgot_password_view.dart';
import 'package:lettutor/pages/navigation_page.dart';
import 'package:lettutor/views/course_detail_view.dart';
import 'package:lettutor/views/become_tutor_view.dart';
import 'package:lettutor/views/booking_detail_view.dart';
import 'package:lettutor/views/teacher_detail_view.dart';
import 'package:lettutor/views/tutor_review_view.dart';
import 'package:lettutor/views/user_profile_view.dart';
import 'package:lettutor/views/video_call_view.dart';
import 'package:lettutor/views/write_review_view.dart';

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
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.pink),
        // primaryColor: Colors.pink,
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
        Routes.courseDetail: (context) => const CourseDetailView(),
        Routes.becomeTutor: (context) => const BecomeTutorView(),
        Routes.bookingDetail: (context) => const BookingDetailView(),
        Routes.review: (context) => const TutorReviewView(),
        Routes.writeReview: (context) => const WriteReviewView(),
        Routes.videoCall: (context) => const VideoCallView(),
        Routes.teacherDetail: (context) => const TeacherDetailView(),
        Routes.userProfile: (context) => const UserProfileView(),
      }
    );
  }
}

