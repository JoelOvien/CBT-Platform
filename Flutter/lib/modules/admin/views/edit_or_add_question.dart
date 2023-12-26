import 'package:cbt_platform/core/app_constants.dart';
import 'package:cbt_platform/theme/app_colors.dart';
import 'package:cbt_platform/theme/text_style_util.dart';
import 'package:cbt_platform/utilities/margin_util.dart';
import 'package:cbt_platform/utilities/widgets/custom_button.dart';
import 'package:cbt_platform/utilities/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  static const String routeName = "/edit";
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final question = TextEditingController();
  final option1 = TextEditingController();
  final option2 = TextEditingController();
  final option3 = TextEditingController();
  final option4 = TextEditingController();
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
            const YMargin(58),
            Text(
              "Add a new question / Edit",
              style: semiBoldStyle(20, AppColors.black1E),
            ),
            const YMargin(43),
            CustomTextField(
              controller: question,
              title: "Enter question here",
              hintText: "....",
            ),
            const YMargin(43),
            Row(
              children: [
                CustomTextField(
                  controller: option1,
                  title: "Option 1",
                  hintText: "Type in something here",
                  width: screenWidth(context, percent: 0.37),
                ),
                const XMargin(251),
                CustomTextField(
                  controller: option2,
                  title: "Option 2",
                  hintText: "Type in something here",
                  width: screenWidth(context, percent: 0.37),
                )
              ],
            ),
            const YMargin(40),
            Row(
              children: [
                CustomTextField(
                  controller: option3,
                  title: "Option 3",
                  hintText: "Type in something here",
                  height: 2,
                  width: screenWidth(context, percent: 0.37),
                ),
                const XMargin(251),
                CustomTextField(
                  controller: option4,
                  title: "Option 4",
                  hintText: "Type in something here",
                  width: screenWidth(context, percent: 0.37),
                )
              ],
            ),
            const YMargin(40),
            Center(
                child:
                    Button(text: "Save Changes", width: 251.0, function: () {}))
          ],
        ),
      ),
    );
  }
}
