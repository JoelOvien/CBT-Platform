import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'modules/onboarding/screens/splash.screen.dart';
import 'theme/theme.dart';
import 'utilities/app_router.util.dart';
import 'utilities/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  setupLocator();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CBT',
      routes: AppRouter.routes,
      theme: AppTheme.cbtTheme,
      initialRoute: SplashScreen.routeName,
      navigatorKey: navigatorKey,
    );
  }
}
