// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';

import '../../../modules/authentication/entities/user_entity.dart';
import '../domains/models/request_response_model.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository {
  @override
  Future<RequestRes> showError(String error) async {
    return RequestRes(
      error: ErrorRes(message: error),
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

  @override
  Future<void> clear() async {
    await _box.then((box) => box.clear());
  }
}