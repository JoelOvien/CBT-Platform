// ignore: one_member_abstracts

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domains/models/request_response_model.dart';

abstract class BaseRepository {
  Future<void> clear(Ref ref);

  Future<RequestRes> showError(Object e);
}
