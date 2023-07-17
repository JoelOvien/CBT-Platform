import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/widgets/custom_button.dart';
import '../../../utilities/widgets/custom_text_field.dart';
import '../domains/providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final matricNo = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: normalStyle(40, AppColors.black),
              ),
              const YMargin(10),
              Text(
                "Welcome back to your Bells University Student Exam Portal",
                style: normalStyle(14, AppColors.grey54),
              ),
              const YMargin(50),
              CustomTextField(
                title: "User-ID",
                controller: matricNo,
                hintText: '0000/0000',
                validator: (_) {
                  if (_!.isEmpty) {
                    return "Enter your id number";
                  }
                  return null;
                },
              ),
              const YMargin(28),
              CustomTextField(
                title: "Password",
                controller: password,
                hintText: 'min. 8 characters',
                validator: (_) {
                  if (_!.isEmpty || _.length < 8) {
                    return "Password length should be more than 8";
                  }
                  return null;
                },
              ),
              const YMargin(21),
              Consumer(builder: (context, ref, __) {
                final loginController = ref.watch(loginProvider);
                return Button(
                  text: "Login",
                  loading: loginController.loading,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      loginController.login(
                        context,
                        idNumber: matricNo.text.trim(),
                        password: password.text.trim(),
                      );
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
