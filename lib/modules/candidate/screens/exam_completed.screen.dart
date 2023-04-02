import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/custom_navigator.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/widgets/custom_button.dart';
import 'result_emailed_success.screen.dart';

class ExamCompletedScreen extends StatelessWidget {
  static const String routeName = "/exam-completed";
  const ExamCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Well-done!",
              style: boldStyle(40, AppColors.black),
            ),
            const YMargin(24),
            Text(
              "Your exam has been submitted\nsuccessfully! You scored ",
              textAlign: TextAlign.center,
              style: normalStyle(24, AppColors.grey54),
            ),
            Text(
              "37/50",
              style: boldStyle(40, AppColors.brandBlue),
            ),
            const YMargin(40),
            Button(
              function: () {
                CustomNavigator.route(context, ResultEmailedSuccessScreen.routeName);
              },
              text: "Emain my result to me",
            ),
            const YMargin(20),
            Button(
              function: () {},
              text: "Send to another email",
              backgroundColor: AppColors.white,
              textColor: AppColors.brandBlue,
              borderColor: AppColors.brandBlue,
            ),
          ],
        ),
      ),
    );
  }
}
