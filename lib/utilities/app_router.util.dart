import 'package:flutter/material.dart';

import '../modules/onboarding/screen/splash.screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
  };
}
