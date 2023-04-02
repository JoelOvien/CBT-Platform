import 'package:flutter/material.dart';

import '../modules/authentication/screens/login.screen.dart';
import '../modules/candidate/screens/exam_completed.screen.dart';
import '../modules/candidate/screens/exam_home.screen.dart';
import '../modules/candidate/screens/exam_selection.screen.dart';
import '../modules/candidate/screens/result_emailed_success.screen.dart';
import '../modules/examiner/screens/course_examination_details.dart';
import '../modules/examiner/screens/edit_or_add_question.dart';
import '../modules/examiner/screens/examiner_screen.dart';
import '../modules/examiner/screens/manage_exams.dart';
import '../modules/onboarding/screens/splash.screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    // onboarding routes
    SplashScreen.routeName: (context) => const SplashScreen(),

    // Auth routes
    LoginScreen.routeName: (context) => const LoginScreen(),

    // examiner routes
    ExaminerScreen.routeName: (context) => const ExaminerScreen(),
    Edit.routeName: (context) => const Edit(),
    Manage.routeName: (context) => const Manage(),
    ExamDetails.routeName: (context) => const ExamDetails(),

    // Candidate routes
    ExamSelectionScreen.routeName: (context) => const ExamSelectionScreen(),
    ExamHomeScreen.routeName: (context) => const ExamHomeScreen(),
    ExamCompletedScreen.routeName: (context) => const ExamCompletedScreen(),
    ResultEmailedSuccessScreen.routeName: (context) => const ResultEmailedSuccessScreen(),
  };
}
