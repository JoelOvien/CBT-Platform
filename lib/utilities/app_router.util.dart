import 'package:flutter/material.dart';

import '../modules/authentication/screens/login.screen.dart';
import '../modules/onboarding/screens/splash.screen.dart';
import '../modules/student/screens/exam_home.screen.dart';
import '../modules/student/screens/exam_selection.screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),

    // students
    ExamSelectionScreen.routeName: (context) => const ExamSelectionScreen(),
    ExamHomeScreen.routeName: (context) => const ExamHomeScreen(),
  };
}
