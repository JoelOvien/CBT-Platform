import 'package:cbt_platform/core/api/endpoints.dart';
import 'package:cbt_platform/modules/candidate/domains/models/questions_bank.model.dart';
import 'package:cbt_platform/modules/candidate/domains/models/registered_courses.model.dart';
import 'package:cbt_platform/modules/candidate/domains/providers/candidate_exam_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/app/domains/models/request_response_model.dart';
import '../../../../core/app/repositories/base_repository.dart';
import '../../../../utilities/helper_util.dart';
import '../../../../utilities/service_locator.dart';

class CandidateRepository extends BaseRepository {
  @override
  Future<void> clear(Ref ref) async {
    ref.invalidate(candidateExamProvider);
  }

  @override
  Future<RequestRes> showError(Object e, {String method = "", dynamic data}) async {
    final String error = Helpers.parseError(e);

    Helpers.logc("$method => $error", error: true);
    return RequestRes(
      error: ErrorRes(message: error, data: data),
    );
  }

  Future<RequestRes> fetchAllRegisteredCoursesForStudent(
    String userID,
    String accessToken,
  ) async {
    final client = locator.get<ApiClient>();

    try {
      client.accessToken = accessToken;
      final List<dynamic> response = await client.get("${AppEndpoints.studentRegisteredCourses}$userID").then((response) => response["registered_courses"]);
      final List<RegisteredCoursesModel> regCourses = response.map<RegisteredCoursesModel>((e) => RegisteredCoursesModel.fromJson(e)).toList();

      return RequestRes(response: regCourses);
    } catch (e) {
      return showError(e);
    }
  }

  Future<RequestRes> fetchQuestionsByCourseCode(
    String userID,
    String accessToken,
    String courseCode,
  ) async {
    final client = locator.get<ApiClient>();

    try {
      client.accessToken = accessToken;
      final List<dynamic> response = await client.get("${AppEndpoints.fetchQuestions}?courseCode=$courseCode&limit=10").then((response) => response["questions"]);
      final List<QuestionBankModel> questions = response.map<QuestionBankModel>((e) => QuestionBankModel.fromJson(e)).toList();

      return RequestRes(response: questions);
    } catch (e) {
      return showError(e);
    }
  }
}
