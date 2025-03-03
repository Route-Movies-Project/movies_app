import 'package:get_it/get_it.dart';
import 'package:movies_app/features/auth/data/data_source/auth_api_data_source.dart';
import 'package:movies_app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:movies_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:movies_app/features/auth/data/data_source/auth_shared_prefs_data_source.dart';
import 'package:movies_app/features/profile/data/data_source/profile_api_data_source.dart';
import 'package:movies_app/features/profile/data/data_source/profile_data_source.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthApiDataSource(),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthSharedPrefsDataSource(),
  );
  getIt.registerLazySingleton<ProfileDataSource>(
    () => ProfileApiDataSource(),
  );
}
