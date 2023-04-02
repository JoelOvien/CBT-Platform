import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/margin_util.dart';

class ResultEmailedSuccessScreen extends StatelessWidget {
  static const String routeName = "/result-emailed-success";
  const ResultEmailedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Successful!",
              style: boldStyle(40, AppColors.black),
            ),
            const YMargin(24),
            Text(
              "Your results have been emailed to you\nsuccessfully. Goodluck!",
              textAlign: TextAlign.center,
              style: normalStyle(24, AppColors.grey54),
            ),
          ],
        ),
      ),
    );
  }
}
