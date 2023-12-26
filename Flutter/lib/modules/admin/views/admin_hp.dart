import 'package:cbt_platform/modules/admin/views/manage_examiners.dart';
import 'package:cbt_platform/utilities/custom_navigator.dart';
import 'package:flutter/material.dart';

import '../../../core/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/widgets/custom_content_box.dart';

class AdminHomePage extends StatefulWidget {
  static const String routeName = '/admin-home-page';
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
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
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                GestureDetector(
                  onTap: () {
                    CustomNavigator.route(context, ManageExaminersPage.routeName);
                  },
                  child: customContentBox("Examiners & Admins", "Manage other admins or examiners"),
                ),
                customContentBox(
                    "Candidates", "Manage all candidates and handle all candidate related issues."),
                customContentBox("Results",
                    "Manage and print all candidate results and manage all result related issues."),
                customContentBox(
                    "Your Profile", "Manage your profile and all security / access related issues.")
              ],
            )
          ],
        ),
      ),
    );
  }
}
