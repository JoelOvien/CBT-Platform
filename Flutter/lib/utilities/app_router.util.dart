import 'package:cbt_platform/modules/admin/views/admin_hp.dart';
import 'package:cbt_platform/modules/admin/views/manage_examiners.dart';
import 'package:flutter/material.dart';

import '../modules/admin/views/course_examination_details.dart';
import '../modules/admin/views/edit_or_add_question.dart';
import '../modules/admin/views/examiner_screen.dart';
import '../modules/admin/views/manage_exams.dart';
import '../modules/authentication/screens/login.screen.dart';
import '../modules/candidate/screens/exam_completed.screen.dart';
import '../modules/candidate/screens/exam_home.screen.dart';
import '../modules/candidate/screens/exam_selection.screen.dart';
import '../modules/candidate/screens/result_emailed_success.screen.dart';
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

    // Admin routes
    AdminHomePage.routeName: (context) => const AdminHomePage(),
    ManageExaminersPage.routeName: (context) => const ManageExaminersPage(),
  };
}
