import 'package:gdgkolkata/service/core/user_preferences.dart';
import 'package:gdgkolkata/service/database_service.dart';
import 'package:get_it/get_it.dart';

import '../auth_service.dart';

void setupServiceLocator() {
  GetIt.I.registerLazySingleton<AuthService>(() => AuthService());
  GetIt.I.registerLazySingleton<DataBaseService>(() => DataBaseService());
  GetIt.I.registerLazySingleton<UserPreferences>(() => UserPreferences());
}
