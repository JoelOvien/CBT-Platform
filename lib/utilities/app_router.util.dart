import 'package:cbt_platform/modules/examiner/screens/edit_or_add_question.dart';
import 'package:cbt_platform/modules/examiner/screens/examiner_screen.dart';
import 'package:flutter/material.dart';

import '../modules/authentication/screens/login.screen.dart';
import '../modules/onboarding/screens/splash.screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    ExaminerScreen.routeName: (context) => const ExaminerScreen(),
    Edit.routeName: (context) => const Edit()
  };
}
