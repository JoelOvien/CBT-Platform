import 'package:cbt_platform/utilities/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/margin_util.dart';

class ManageExaminersPage extends StatelessWidget {
  static const String routeName = '/manage_examiners';
  const ManageExaminersPage({super.key});

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
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 103),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Manage Examiners",
                  style: semiBoldStyle(16, AppColors.black1E),
                ),
                Button(
                  width: 166,
                  borderRadius: 100,
                  text: "Add new examiner",
                  function: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
