import 'package:cbt_platform/modules/examiner/examiner_screen.dart';
import 'package:flutter/material.dart';

import '../modules/authentication/screens/login.screen.dart';
import '../modules/onboarding/screens/splash.screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    ExaminerScreen.routeName: (context) => const ExaminerScreen(),
  };
}
