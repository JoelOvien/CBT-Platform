import 'package:flutter/material.dart';

import '../../../core/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/widgets/custom_button.dart';

class ExamHomeScreen extends StatefulWidget {
  static const String routeName = "examHome";
  const ExamHomeScreen({super.key});

  @override
  State<ExamHomeScreen> createState() => _ExamHomeScreenState();
}

class _ExamHomeScreenState extends State<ExamHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth(context, percent: 0.056)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.schoolNameSec,
                    style: boldStyle(20, AppColors.black),
                  ),
                  Text(
                    "Computer Based Test (CBT) 2023",
                    style: normalStyle(14, AppColors.grey7c),
                  ),
                ],
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: "You have ",
                  style: mediumStyle(16, AppColors.black),
                  children: [
                    TextSpan(
                      text: ": 00:05: 34 (mins) left",
                      style: boldStyle(16, AppColors.black),
                    ),
                  ],
                ),
              ),
              const XMargin(24),
              Button(
                borderRadius: 100,
                text: "Submit your work",
                function: () {},
                width: screenWidth(context, percent: .100),
              ),
              const XMargin(72),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          YMargin(screenHeight(context, percent: 0.040)),
        ],
      ),
    );
  }
}
