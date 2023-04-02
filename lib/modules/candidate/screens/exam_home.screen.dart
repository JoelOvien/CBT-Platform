import 'package:flutter/material.dart';

import '../../../core/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/custom_navigator.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/widgets/custom_button.dart';
import 'exam_completed.screen.dart';

class ExamHomeScreen extends StatefulWidget {
  static const String routeName = "examHome";
  const ExamHomeScreen({super.key});

  @override
  State<ExamHomeScreen> createState() => _ExamHomeScreenState();
}

class _ExamHomeScreenState extends State<ExamHomeScreen> {
  List buttonList = [...List.generate(30, (index) => "")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight(context, percent: 0.1),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 43),
        child: Column(
          children: [
            YMargin(screenHeight(context, percent: 0.040)),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          runSpacing: 44,
                          spacing: 10,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: AppColors.white,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.black,
                                size: 12,
                              ),
                            ),
                            ...List.generate(buttonList.length, (index) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: const CircleBorder(),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "${index + 1}",
                                  style: semiBoldStyle(13, AppColors.white),
                                ),
                              );
                            }),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: AppColors.white,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.black,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                        const YMargin(100),
                        Text(
                          "Suppose we are sorting an array of eight integers using some quadratic sorting algorithm. After four iterations of the algorithm's main loop, the array elements are ordered as shown here: 2 4 5 7 8 1 3 6",
                          style: boldStyle(20, AppColors.black1E, height: 2.0),
                        ),
                        const YMargin(49),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button(
                              borderRadius: 100,
                              text: "Previous",
                              function: () {},
                              width: screenWidth(context, percent: .100),
                            ),
                            Button(
                              borderRadius: 100,
                              text: "Next",
                              function: () {
                                CustomNavigator.routeForEver(
                                    context, ExamCompletedScreen.routeName);
                              },
                              width: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const XMargin(50),
                Column(
                  children: [
                    Container(
                      width: 325,
                      padding: const EdgeInsets.fromLTRB(22, 14, 22, 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          titleValueTextWidget("Course Code: ", "CSC 419"),
                          const YMargin(20),
                          titleValueTextWidget("Course Title: ", "Introduction to modern C++"),
                          const YMargin(20),
                          titleValueTextWidget("Duration: ", "40 mins")
                        ],
                      ),
                    ),
                    const YMargin(42),
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          width: 284,
                          height: 235,
                          padding: const EdgeInsets.fromLTRB(10, 20, 40, 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white.withOpacity(0.7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 325,
                          height: 222,
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Student Details",
                                style: boldStyle(14, AppColors.black1E),
                              ),
                              const YMargin(8),
                              Text(
                                "Please always confirm your details are correct",
                                textAlign: TextAlign.right,
                                style: mediumStyle(12, AppColors.black1E),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Container(
                                    height: 61,
                                    width: 61,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const XMargin(20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Helen Adeleye",
                                        style: boldStyle(14, AppColors.black1E),
                                      ),
                                      Text(
                                        "helen.adeleye@students.bells.ng",
                                        style: mediumStyle(12, AppColors.black1E),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Button(
                                text: "Report a Problem",
                                backgroundColor: AppColors.white,
                                borderColor: AppColors.brandBlue,
                                textColor: AppColors.brandBlue,
                                function: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget titleValueTextWidget(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: mediumStyle(12, AppColors.black1E),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: boldStyle(12, AppColors.black1E),
          ),
        ),
      ),
    ],
  );
}
