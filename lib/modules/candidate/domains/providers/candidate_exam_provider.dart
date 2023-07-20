// ignore_for_file: use_build_context_synchronously

import 'package:cbt_platform/core/app/domains/providers/app_provider.dart';
import 'package:cbt_platform/main.dart';
import 'package:cbt_platform/modules/candidate/domains/models/answer_bank.model.dart';
import 'package:cbt_platform/modules/candidate/domains/models/questions_bank.model.dart';
import 'package:cbt_platform/modules/candidate/domains/models/registered_courses.model.dart';
import 'package:cbt_platform/modules/candidate/domains/repository/candidate.repository.dart';
import 'package:cbt_platform/utilities/helper_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/app/domains/models/request_response_model.dart';
import '../../../../utilities/custom_navigator.dart';
import '../../../../utilities/service_locator.dart';
import '../../../../utilities/snack_bar_util.dart';
import '../../screens/exam_completed.screen.dart';

ChangeNotifierProvider<CandidateExamProvider> candidateExamProvider = ChangeNotifierProvider((ref) => CandidateExamProvider(ref: ref));

class CandidateExamProvider extends ChangeNotifier {
  CandidateExamProvider({required this.ref});
  Ref ref;

  bool _loading = false;
  bool _loadingQuestions = false;
  bool _loadingRegisteredCourses = false;
  bool _loadingSubmission = false;

  int _selectedQuestionNumber = 0;

  RegisteredCoursesModel _selectedCourse = RegisteredCoursesModel();

  List<RegisteredCoursesModel> registeredCourses = [];
  List<QuestionBankModel> questionsBank = [];
  List<AnswerBankModel> answerBank = [];
  List<String> selectedQuestionOptions = [];

  bool get loading => _loading;
  bool get loadingRegisteredCourses => _loadingRegisteredCourses;
  bool get loadingQuestions => _loadingQuestions;
  bool get loadingSubmission => _loadingSubmission;

  int get selectedQuestionNumber => _selectedQuestionNumber;

  RegisteredCoursesModel get selectedCourse => _selectedCourse;

  void addAnswer(AnswerBankModel answer) {
    answerBank.add(answer);
  }

  set selectedCourse(RegisteredCoursesModel state) {
    _selectedCourse = state;
    fetchQuestionsByCourseCode();
    notifyListeners();
  }

  set selectedQuestionNumber(int state) {
    _selectedQuestionNumber = state;
    notifyListeners();
    populateQuestionOptions();
  }

  void populateQuestionOptions() {
    if (questionsBank[selectedQuestionNumber].answerTypeID == "1") {
      selectedQuestionOptions.add(questionsBank[selectedQuestionNumber].answer1 ?? "");
      selectedQuestionOptions.add(questionsBank[selectedQuestionNumber].answer2 ?? "");
      selectedQuestionOptions.add(questionsBank[selectedQuestionNumber].answer3 ?? "");
      selectedQuestionOptions.add(questionsBank[selectedQuestionNumber].answer4 ?? "");
    }
    notifyListeners();
  }

  int linearCongruential(int seed, int a, int c, int m) {
    return (a * seed + c) % m;
  }

  List<String> randomizedOptionList(List<String> inputList, int seed) {
    const int a = 1664525;
    const int c = 1013904223;
    const int m = 2147483647;

    final List<String> randomizedList = List.from(inputList);
    final int length = randomizedList.length;

    for (int i = 0; i < length; i++) {
      seed = linearCongruential(seed, a, c, m);
      final int randomIndex = seed % length;

      // Swap elements to shuffle the list
      final String temp = randomizedList[i];
      randomizedList[i] = randomizedList[randomIndex];
      randomizedList[randomIndex] = temp;
    }

    return randomizedList;
  }

  set loadingQuestions(bool state) {
    _loadingQuestions = state;
    notifyListeners();
  }

  set loadingRegisteredCourses(bool state) {
    _loadingRegisteredCourses = state;
    notifyListeners();
  }

  set loading(bool state) {
    _loading = state;
    notifyListeners();
  }

  set loadingSubmission(bool state) {
    _loadingSubmission = state;
    notifyListeners();
  }

  Future<void> fetchAllRegisteredCoursesForStudent(BuildContext context) async {
    try {
      final user = ref.read(appProvider).user;
      loadingRegisteredCourses = true;
      final RequestRes res = await locator.get<CandidateRepository>().fetchAllRegisteredCoursesForStudent(
            user.data!.userID ?? "",
            user.accessToken ?? "",
          );
      loadingRegisteredCourses = false;

      if (res.hasError()) {
        SnackbarUtil.showErrorSnack(context, res.error!.message);
      } else {
        registeredCourses.clear();
        registeredCourses.addAll(res.response as List<RegisteredCoursesModel>);
        notifyListeners();
      }
    } catch (e) {
      Helpers.logc(e);
      loadingRegisteredCourses = false;
    }
  }

  Future<void> fetchQuestionsByCourseCode() async {
    try {
      final user = ref.read(appProvider).user;
      loadingQuestions = true;
      final RequestRes res = await locator.get<CandidateRepository>().fetchQuestionsByCourseCode(
            user.data!.userID ?? "",
            user.accessToken ?? "",
            selectedCourse.courseCode ?? "",
          );
      loadingQuestions = false;

      if (res.hasError()) {
        SnackbarUtil.showErrorSnack(navigatorKey.currentState!.context, res.error!.message);
      } else {
        questionsBank.clear();
        questionsBank.addAll(res.response as List<QuestionBankModel>);
        answerBank = List.generate(questionsBank.length, (_) => AnswerBankModel());
        selectedQuestionNumber = 0;
        notifyListeners();
      }
    } catch (e) {
      Helpers.logc(e);
      loadingQuestions = false;
    }
  }

  Future<void> submitAnswers() async {
    try {
      final user = ref.read(appProvider).user;

      loadingSubmission = true;
      final RequestRes res = await locator.get<CandidateRepository>().submitAnswers(
            user.accessToken ?? "",
            answerBank,
          );
      loadingQuestions = false;

      if (res.hasError()) {
        SnackbarUtil.showErrorSnack(navigatorKey.currentState!.context, res.error!.message);
      } else {
        CustomNavigator.routeForEver(navigatorKey.currentState!.context, ExamCompletedScreen.routeName);
      }
      loadingSubmission = false;
    } catch (e) {
      loadingSubmission = false;
      Helpers.logc(e);
    }
  }
}
