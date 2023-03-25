import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/helper_util.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/widgets/custom_button.dart';
import '../../../utilities/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final matricNo = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              width: screenWidth(context, percent: 0.454),
              title: "Matric Number",
              controller: matricNo,
              hintText: '0000/0000',
            ),
            const YMargin(28),
            CustomTextField(
              width: screenWidth(context, percent: 0.454),
              title: "Password",
              controller: password,
              hintText: 'min. 8 characters',
            ),
            const YMargin(21),
            Button(
              text: "Login",
              function: () {
                Helpers.logc("hey");
              },
            ),
          ],
        ),
      ),
    );
  }
}
