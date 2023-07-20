import 'package:cbt_platform/modules/authentication/domains/providers/login_provider.dart';
import 'package:cbt_platform/modules/candidate/domains/providers/candidate_exam_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/widgets/custom_button.dart';

class ExamCompletedScreen extends ConsumerWidget {
  static const String routeName = "/exam-completed";
  const ExamCompletedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final candidateExamController = ref.watch(candidateExamProvider);
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
              "${candidateExamController.userScore}/${candidateExamController.returnedResult.length}",
              style: boldStyle(40, AppColors.brandBlue),
            ),
            const YMargin(40),
            Button(
              function: () {
                ref.read(loginProvider).logOut(context);
              },
              text: "Log Out",
            ),
          ],
        ),
      ),
    );
  }
}
