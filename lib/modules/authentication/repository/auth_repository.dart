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
  Future<void> clear() async {}

  @override
  Future<RequestRes> showError(dynamic error) async {
    final e = Helpers.parseError(error);
    Helpers.logc(e, error: true);
    return RequestRes(
      error: ErrorRes(message: e),
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
          "id_number": idNumber,
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
