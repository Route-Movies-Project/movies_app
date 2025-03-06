import 'package:get_it/get_it.dart';
import 'package:movies_app/features/auth/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/data/data_source/auth_api_data_source.dart';
import 'package:movies_app/features/auth/data/data_source/auth_shared_prefs_data_source.dart';
import 'package:movies_app/features/auth/repositories/auth_repositorie.dart';
import 'package:movies_app/features/home/cubit/movies_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_genre_cubit.dart';
import 'package:movies_app/features/home/data/data_source/movies_api_data_source.dart';
import 'package:movies_app/features/home/repository/movies_repository.dart';
import 'package:movies_app/features/profile/cubit/profile_cubit.dart';
import 'package:movies_app/features/profile/data/data_source/profile_api_data_source.dart';
import 'package:movies_app/features/profile/repository/profile_repository.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<AuthCubit>(
    AuthCubit(
      AuthRepositorie(AuthApiDataSource(), AuthSharedPrefsDataSource()),
    ),
  );
  getIt.registerSingleton<ProfileCubit>(
    ProfileCubit(
      ProfileRepository(
        ProfileApiDataSource(),
      ),
    ),
  );
  getIt.registerSingleton(
    MoviesCubit(
      MoviesRepository(
        MoviesApiDataSource(),
      ),
    ),
  );
  getIt.registerSingleton(
    MoviesGenreCubit(
      MoviesRepository(
        MoviesApiDataSource(),
      ),
    ),
  );
}
