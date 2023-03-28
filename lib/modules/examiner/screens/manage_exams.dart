import 'package:cbt_platform/core/app_constants.dart';
import 'package:cbt_platform/theme/app_colors.dart';
import 'package:cbt_platform/theme/text_style_util.dart';
import 'package:cbt_platform/utilities/margin_util.dart';
import 'package:cbt_platform/utilities/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Manage extends StatefulWidget {
  static const String routeName = "/manage";
  const Manage({super.key});

  @override
  State<Manage> createState() => _ManageState();
}

class _ManageState extends State<Manage> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(58),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Manage your exam questions and times",
                  style: semiBoldStyle(20, AppColors.black1E),
                ),
                Button(
                    text: "Upload a new exam",
                    borderRadius: 50,
                    width: 172,
                    function: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
