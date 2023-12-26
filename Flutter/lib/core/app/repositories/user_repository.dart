// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../modules/authentication/domains/entities/user_entity.dart';
import '../../../utilities/helper_util.dart';
import '../domains/models/request_response_model.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository {
  @override
  Future<void> clear(Ref ref) async {
    await _box.then((box) => box.clear());
  }

  @override
  Future<RequestRes> showError(Object e, {String method = "", dynamic data}) async {
    final String error = Helpers.parseError(e);

    Helpers.logc("$method => $error", error: true);
    return RequestRes(
      error: ErrorRes(message: error, data: data),
    );
  }

  Future<Box<UserEntity>> get _box async {
    final box = await Hive.openBox<UserEntity>(UserEntity.tableName);
    return box;
  }

  Future<UserEntity?> getUser() async {
    final box = await _box;
    return box.get(UserEntity.localId);
  }

  Future<UserEntity?> setUser({
    required Map<String, dynamic> userData,
  }) async {
    // ignore: unused_local_variable
    final oldUser = await getUser();

    final UserEntity newUser = UserEntity(userData: userData, uuid: userData["user_id"]);
    final box = await _box;
    await box.put(UserEntity.localId, newUser);
    return newUser;
  }
}
