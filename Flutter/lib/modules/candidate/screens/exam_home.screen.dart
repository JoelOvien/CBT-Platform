import 'package:cbt_platform/core/app/domains/providers/app_provider.dart';
import 'package:cbt_platform/modules/authentication/domains/providers/login_provider.dart';
import 'package:cbt_platform/modules/candidate/domains/models/answer_bank.model.dart';
import 'package:cbt_platform/utilities/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_style_util.dart';
import '../../../utilities/margin_util.dart';
import '../../../utilities/timer.util.dart';
import '../../../utilities/widgets/custom_button.dart';
import '../domains/providers/candidate_exam_provider.dart';

class ExamHomeScreen extends ConsumerStatefulWidget {
  static const String routeName = "examHome";
  const ExamHomeScreen({super.key});

  @override
  ConsumerState<ExamHomeScreen> createState() => _ExamHomeScreenState();
}

class _ExamHomeScreenState extends ConsumerState<ExamHomeScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final timer = ref.watch(timerProvider);

    final candidateExamController = ref.watch(candidateExamProvider);
    final user = ref.watch(appProvider).user;
    final currentQuestion = candidateExamController.questionsBank[candidateExamController.selectedQuestionNumber];
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
                        text: "${timer.inMinutes}:${(timer.inSeconds % 60).toString().padLeft(2, '0')}",
                        style: boldStyle(16, AppColors.black),
                      ),
                    ],
                  ),
                ),
                const XMargin(24),
                Button(
                  borderRadius: 100,
                  text: "Submit your work",
                  loading: candidateExamController.loadingSubmission,
                  function: () {
                    candidateExamController.submitAnswers();
                  },
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
              Column(
                children: [
                  if (candidateExamController.questionsBank.isEmpty)
                    SizedBox(
                      height: screenHeight(context, percent: 0.7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "No questions uploaded yet, contact the ICT Admin",
                              style: mediumStyle(14, AppColors.brandBlue),
                            ),
                          ),
                          const YMargin(100),
                          Button(
                            text: "Refresh",
                            loading: candidateExamController.loadingRegisteredCourses,
                            function: () {
                              ref.read(loginProvider).login(context, idNumber: "2018-6990", password: "Test1234");
                              //
                            },
                          ),
                          const YMargin(20),
                        ],
                      ),
                    )
                  else
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
                                      onPressed: () {
                                        if (candidateExamController.selectedQuestionNumber > 0) {
                                          candidateExamController.selectedQuestionNumber--;
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: AppColors.white,
                                        shape: const CircleBorder(side: BorderSide(color: AppColors.f5White)),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back_ios,
                                        color: AppColors.black,
                                        size: 12,
                                      ),
                                    ),
                                    ...List.generate(candidateExamController.questionsBank.length, (index) {
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          shape: const CircleBorder(side: BorderSide(color: AppColors.f5White)),
                                          backgroundColor: candidateExamController.selectedQuestionNumber == index ? AppColors.brandBlue : AppColors.white,
                                        ),
                                        onPressed: () {
                                          candidateExamController.selectedQuestionNumber = index;
                                        },
                                        child: Text(
                                          "${index + 1}",
                                          style: semiBoldStyle(13, candidateExamController.selectedQuestionNumber != index ? AppColors.brandBlue : AppColors.white),
                                        ),
                                      );
                                    }),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (candidateExamController.selectedQuestionNumber != candidateExamController.questionsBank.length - 1) {
                                          candidateExamController.selectedQuestionNumber++;
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: AppColors.white,
                                        shape: const CircleBorder(side: BorderSide(color: AppColors.f5White)),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.black,
                                        size: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const YMargin(49),
                                Text(
                                  currentQuestion.question ?? "",
                                  style: boldStyle(20, AppColors.black1E, height: 2.0),
                                ),
                                const YMargin(49),
                                if (currentQuestion.answerTypeID == "1")
                                  Consumer(builder: (context, ref, __) {
                                    final optionButtonValue = ref.watch(candidateExamProvider).selectedQuestionOptions;
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            optionButton(
                                              data: "1. ${optionButtonValue[0]}",
                                              selected: candidateExamController.answerBank[candidateExamController.selectedQuestionNumber].answerProvided == optionButtonValue[0],
                                              onPressed: () {
                                                candidateExamController.answerBank[candidateExamController.selectedQuestionNumber] = AnswerBankModel(
                                                  userID: user.data?.userID ?? "",
                                                  questionID: currentQuestion.questionID,
                                                  correctAnswer: currentQuestion.correctAnswer,
                                                  courseCode: currentQuestion.courseCode,
                                                  semester: "S",
                                                  session: "2022/2023",
                                                  answerProvided: optionButtonValue[0],
                                                );
                                              },
                                            ),
                                            optionButton(
                                              data: "2. ${optionButtonValue[1]}",
                                              selected: candidateExamController.answerBank[candidateExamController.selectedQuestionNumber].answerProvided == optionButtonValue[1],
                                              onPressed: () {
                                                candidateExamController.answerBank[candidateExamController.selectedQuestionNumber] = AnswerBankModel(
                                                  userID: user.data?.userID ?? "",
                                                  questionID: currentQuestion.questionID,
                                                  correctAnswer: currentQuestion.correctAnswer,
                                                  courseCode: currentQuestion.courseCode,
                                                  semester: "S",
                                                  session: "2022/2023",
                                                  answerProvided: optionButtonValue[1],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        const YMargin(20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            optionButton(
                                              data: "3. ${optionButtonValue[2]}",
                                              selected: candidateExamController.answerBank[candidateExamController.selectedQuestionNumber].answerProvided == optionButtonValue[2],
                                              onPressed: () {
                                                candidateExamController.answerBank[candidateExamController.selectedQuestionNumber] = AnswerBankModel(
                                                  userID: user.data?.userID ?? "",
                                                  questionID: currentQuestion.questionID,
                                                  correctAnswer: currentQuestion.correctAnswer,
                                                  courseCode: currentQuestion.courseCode,
                                                  semester: "S",
                                                  session: "2022/2023",
                                                  answerProvided: optionButtonValue[2],
                                                );
                                              },
                                            ),
                                            optionButton(
                                              data: "4. ${optionButtonValue[3]}",
                                              selected: candidateExamController.answerBank[candidateExamController.selectedQuestionNumber].answerProvided == optionButtonValue[3],
                                              onPressed: () {
                                                candidateExamController.answerBank[candidateExamController.selectedQuestionNumber] = AnswerBankModel(
                                                  userID: user.data?.userID ?? "",
                                                  questionID: currentQuestion.questionID,
                                                  correctAnswer: currentQuestion.correctAnswer,
                                                  courseCode: currentQuestion.courseCode,
                                                  semester: "S",
                                                  session: "2022/2023",
                                                  answerProvided: optionButtonValue[3],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  })
                                else
                                  CustomTextField(
                                    controller: TextEditingController(),
                                    title: "Your Answer",
                                  ),
                                const YMargin(49),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (candidateExamController.selectedQuestionNumber > 0)
                                      Button(
                                        borderRadius: 100,
                                        text: "Previous",
                                        function: () {
                                          if (candidateExamController.selectedQuestionNumber > 0) {
                                            candidateExamController.selectedQuestionNumber--;
                                          }
                                        },
                                        width: screenWidth(context, percent: .100),
                                      )
                                    else
                                      const SizedBox.shrink(),
                                    if (candidateExamController.selectedQuestionNumber != candidateExamController.questionsBank.length - 1)
                                      Button(
                                        borderRadius: 100,
                                        text: "Next",
                                        function: () {
                                          if (candidateExamController.selectedQuestionNumber != candidateExamController.questionsBank.length - 1) {
                                            candidateExamController.selectedQuestionNumber++;
                                          }
                                        },
                                        width: 150,
                                      )
                                    else
                                      const SizedBox.shrink(),
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
                                children: [titleValueTextWidget("Course Code: ", candidateExamController.selectedCourse.courseCode!), const YMargin(40), titleValueTextWidget("Duration: ", "10 mins")],
                              ),
                            ),
                            const YMargin(42),
                            Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  width: 284,
                                  height: 225,
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
                                  height: 212,
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
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${user.data?.firstName} ${user.data?.surname} - ${user.data?.userID}",
                                            style: boldStyle(14, AppColors.black1E),
                                          ),
                                          Text(
                                            '${user.data?.emailAddress}',
                                            style: mediumStyle(12, AppColors.black1E),
                                          ),
                                        ],
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
            ],
          ),
        ));
  }
}

Widget optionButton({
  required void Function()? onPressed,
  required String data,
  required selected,
}) {
  return MaterialButton(
    color: selected ? AppColors.successGreen : Colors.white,
    onPressed: onPressed,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: selected ? AppColors.successGreen : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 60,
      width: 325,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          data,
          style: normalStyle(14, selected ? AppColors.white : AppColors.black),
        ),
      ),
    ),
  );
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
