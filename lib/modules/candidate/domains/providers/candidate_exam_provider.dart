import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/course_model.dart';

ChangeNotifierProvider<CandidateExamProvider> candidateExamProvider =
    ChangeNotifierProvider((ref) => CandidateExamProvider(ref: ref));

class CandidateExamProvider extends ChangeNotifier {
  CandidateExamProvider({required this.ref});
  Ref ref;

  bool _passVisible = false;
  bool _passRem = false;
  bool _loading = false;
  CourseModel _selectedCourse = CourseModel();

  List<CourseModel> courses = [
    CourseModel(
      courseCode: "CSC 201",
      courseTitle: "Introduction to modern C++",
    ),
    CourseModel(
      courseCode: "CSC 405",
      courseTitle: "Introduction to modern C++",
    ),
    CourseModel(
      courseCode: "AMS 207",
      courseTitle: "Introduction to modern C++",
    ),
    CourseModel(
      courseCode: "ITP 301",
      courseTitle: "Introduction to modern C++",
    ),
    CourseModel(
      courseCode: "ITP 305",
      courseTitle: "Introduction to modern C++",
    ),
  ];

  bool get loading => _loading;
  bool get passVisible => _passVisible;
  bool get passRem => _passRem;
  CourseModel get selectedCourse => _selectedCourse;

  set selectedCourse(CourseModel state) {
    _selectedCourse = state;
    notifyListeners();
  }

  set passVisible(bool state) {
    _passVisible = state;
    notifyListeners();
  }

  set passRem(bool state) {
    _passRem = state;
    notifyListeners();
  }

  set loading(bool state) {
    _loading = state;
    notifyListeners();
  }
}
