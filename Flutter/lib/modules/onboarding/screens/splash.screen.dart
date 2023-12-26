// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../animations/fade_in_animation.dart';
import '../../../core/app/domains/providers/app_provider.dart';
import '../../../main.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = "/splash_screen";

  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    final setup = ref.read(appProvider);

    await setup.initialise(context);
    await Future.delayed(const Duration(seconds: 1));
    await setup.goHome(navigatorKey.currentState!.context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FadeInAnimations(
          delay: 0.1,
          child: FlutterLogo(
            size: 300,
          ),
        ),
      ),
    );
  }
}
