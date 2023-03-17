// ignore: one_member_abstracts

import '../domains/models/request_response_model.dart';

abstract class BaseRepository {
  Future<void> clear();

  Future<RequestRes> showError(String error);
}
