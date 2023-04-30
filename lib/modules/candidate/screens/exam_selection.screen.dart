import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/custom_navigator.dart';
import '../../../utilities/margin_util.dart';
import '../domains/providers/candidate_exam_provider.dart';
import 'exam_home.screen.dart';

class ExamSelectionScreen extends StatefulWidget {
  static const String routeName = "examSelection";
  const ExamSelectionScreen({super.key});

  @override
  State<ExamSelectionScreen> createState() => _ExamSelectionScreenState();
}

class _ExamSelectionScreenState extends State<ExamSelectionScreen> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.schoolNameSec,
                style: boldStyle(20, AppColors.black),
              ),
              Text(
                "Computer Based Test (CBT) ${DateTime.now().year}",
                style: normalStyle(14, AppColors.grey7c),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context, percent: 0.066)),
        child: SingleChildScrollView(
          child: Consumer(builder: (context, ref, __) {
            final candidateExamController = ref.watch(candidateExamProvider);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(screenHeight(context, percent: 0.069)),
                Text(
                  "Please select your examination, login and start immediately!",
                  style: semiBoldStyle(20, AppColors.black1E),
                ),
                YMargin(screenHeight(context, percent: 0.047)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Wrap(
                        runSpacing: 36,
                        spacing: 19,
                        children: [
                          ...List.generate(
                            candidateExamController.courses.length,
                            (index) => MaterialButton(
                              onPressed: () {
                                candidateExamController.selectedCourse =
                                    candidateExamController.courses[index];
                                CustomNavigator.route(context, ExamHomeScreen.routeName);
                              },
                              padding: EdgeInsets.zero,
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                height: screenHeight(context, percent: 0.172),
                                width: screenHeight(context, percent: 0.293),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grey200,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // SvgPicture.asset(SvgAssetsPath.courseIcon),
                                        Text(
                                          candidateExamController.courses[index].courseCode!,
                                          style: mediumStyle(
                                            18,
                                            AppColors.black1E,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const YMargin(19),
                                    Text(
                                      "Introduction to computer science",
                                      style: normalStyle(12, AppColors.grey68),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Get Started",
                                      style: mediumStyle(12, AppColors.brandBlue),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    XMargin(screenWidth(context, percent: 0.069)),
                    Container(
                      width: 409,
                      padding: const EdgeInsets.fromLTRB(10, 20, 40, 50),
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
                            "Examination Rules",
                            style: boldStyle(20, AppColors.black1E),
                          ),
                          const YMargin(10),
                          Text(
                            "1. The new CBT is split into two parts: Part A covers numeracy and Part B covers clinical questions for nursing or midwifery.\n\n2. The fee for sitting both parts of the new CBT will stay at £83. If you need to resit the new CBT, the following fees will apply.\n\n3. If you choose to take the Test of Competence for return to practice, you need to first book the Test of Competence in your NMC Online account.\n\n4. Once you get a confirmation email from Pearson Vue that your account has been created, you can log in, book and pay for your exam.\n\n5. Goodluck!",
                            style: mediumStyle(12, AppColors.black1E, height: 2.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                YMargin(screenHeight(context, percent: 0.069)),
              ],
            );
          }),
        ),
      ),
    );
  }
}
