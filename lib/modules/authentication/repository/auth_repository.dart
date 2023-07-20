import 'package:cbt_platform/modules/authentication/domains/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/endpoints.dart';
import '../../../core/app/domains/models/request_response_model.dart';
import '../../../core/app/domains/models/user.model.dart';
import '../../../core/app/repositories/base_repository.dart';
import '../../../utilities/helper_util.dart';
import '../../../utilities/service_locator.dart';

class AuthRepository extends BaseRepository {
  AuthRepository();
  @override
  Future<void> clear(Ref ref) async {
    ref.invalidate(loginProvider);
  }

  @override
  Future<RequestRes> showError(Object e, {String method = "", dynamic data}) async {
    final String error = Helpers.parseError(e);

    Helpers.logc("$method => $error", error: true);
    return RequestRes(
      error: ErrorRes(message: error, data: data),
    );
  }

  Future<RequestRes> login({
    required String idNumber,
    required String password,
  }) async {
    final client = locator.get<ApiClient>();

    try {
      final response = await client.post(
        AppEndpoints.login,
        data: {
          "UserID": idNumber,
          "password": password,
        },
      );

      final loginResponse = UserModel.fromJson(response);

      return RequestRes(response: loginResponse);
    } catch (e) {
      return showError(e);
    }
  }
}
