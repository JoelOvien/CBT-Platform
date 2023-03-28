import 'package:cbt_platform/core/app_constants.dart';
import 'package:cbt_platform/theme/text_style_util.dart';
import 'package:cbt_platform/utilities/widgets/custom_content_box.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utilities/margin_util.dart';

class ExaminerScreen extends StatefulWidget {
  static const String routeName = "/examinerScreen";
  const ExaminerScreen({super.key});

  @override
  State<ExaminerScreen> createState() => _ExaminerScreenState();
}

class _ExaminerScreenState extends State<ExaminerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth(context, percent: 0.056)),
          child: Column(
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 66),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(69.0),
            Text(
              "Welcome Back, Joel Ovienloba!",
              style: semiBoldStyle(20, AppColors.black1E),
            ),
            const YMargin(47),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customContentBox("Examinations",
                    "Upload and manage examinations to be taken and written by students."),
                customContentBox("Candidates",
                    "Manage all candidates and handle all candidate related issues."),
                customContentBox("Results",
                    "Manage and print all candidate results and manage all result related issues."),
                customContentBox("Your Profile",
                    "Manage your profile and all security / access related issues.")
              ],
            )
          ],
        ),
      ),
    );
  }
}
