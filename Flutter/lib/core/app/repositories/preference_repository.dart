// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../utilities/helper_util.dart';
import '../domains/models/request_response_model.dart';
import 'base_repository.dart';

class PreferenceRepository extends BaseRepository {
  Future<Box> get _box async {
    final box = await Hive.openBox('preferences');
    return box;
  }

  Future<void> put(String key, dynamic value) async {
    final box = await _box;
    return box.put(key, value);
  }

  Future<dynamic> get(String key, {dynamic defaultValue}) async {
    final box = await _box;
    return box.get(key, defaultValue: defaultValue);
  }

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
}
