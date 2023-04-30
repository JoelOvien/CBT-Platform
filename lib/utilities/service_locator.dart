import 'package:get_it/get_it.dart';

import '../core/api/api_client.dart';
import '../core/app/db.dart';
import '../core/app/domains/providers/app_provider.dart';
import '../core/app/repositories/base_repository.dart';
import '../core/app/repositories/preference_repository.dart';
import '../core/app/repositories/user_repository.dart';
import '../modules/authentication/repository/auth_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  //API
  locator.registerFactory<ApiClient>(ApiClient.new);

  locator.registerLazySingleton<DbConfig>(DbConfig.new);

  // Controller
  locator.registerSingleton<AppProvider>(AppProvider());

  //Repository
  locator.registerLazySingleton<PreferenceRepository>(PreferenceRepository.new);
  locator.registerLazySingleton<AuthRepository>(AuthRepository.new);
  locator.registerLazySingleton<UserRepository>(UserRepository.new);
}

List<BaseRepository> repositories = [
  locator.get<PreferenceRepository>(),
  locator.get<UserRepository>(),
  locator.get<AuthRepository>(),
];
