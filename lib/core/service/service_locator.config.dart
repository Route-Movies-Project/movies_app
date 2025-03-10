// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_app/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i147;
import 'package:movies_app/features/auth/data/data_source/local/auth_shared_prefs_data_source.dart'
    as _i381;
import 'package:movies_app/features/auth/data/data_source/remote/auth_api_data_source.dart'
    as _i270;
import 'package:movies_app/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i94;
import 'package:movies_app/features/auth/data/repositories/auth_repositorie.dart'
    as _i186;
import 'package:movies_app/features/auth/domain/repositories/auth_repositorie.dart'
    as _i28;
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i489;
import 'package:movies_app/features/home/cubit/movies_cubit.dart' as _i790;
import 'package:movies_app/features/home/cubit/movies_genre_cubit.dart'
    as _i298;
import 'package:movies_app/features/home/data/data_source/movies_api_data_source.dart'
    as _i579;
import 'package:movies_app/features/home/data/data_source/movies_data_source.dart'
    as _i992;
import 'package:movies_app/features/home/repository/movies_repository.dart'
    as _i806;
import 'package:movies_app/features/movie_detials/cubit/suggestion_cubit.dart'
    as _i313;
import 'package:movies_app/features/movie_detials/data/data_source/suggestion_api_data_source.dart'
    as _i309;
import 'package:movies_app/features/movie_detials/data/data_source/suggestion_data_source.dart'
    as _i131;
import 'package:movies_app/features/movie_detials/repository/suggestion_repository.dart'
    as _i991;
import 'package:movies_app/features/profile/cubit/profile_cubit.dart' as _i625;
import 'package:movies_app/features/profile/data/data_source/profile_api_data_source.dart'
    as _i654;
import 'package:movies_app/features/profile/data/data_source/profile_data_source.dart'
    as _i423;
import 'package:movies_app/features/profile/repository/profile_repository.dart'
    as _i364;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i94.AuthRemoteDataSource>(() => _i270.AuthApiDataSource());
    gh.singleton<_i131.SuggestionDataSource>(
        () => _i309.SuggestionApiDataSource());
    gh.singleton<_i147.AuthLocalDataSource>(
        () => _i381.AuthSharedPrefsDataSource());
    gh.singleton<_i992.MoviesDataSource>(() => _i579.MoviesApiDataSource());
    gh.singleton<_i991.SuggestionRepository>(
        () => _i991.SuggestionRepository(gh<_i131.SuggestionDataSource>()));
    gh.singleton<_i423.ProfileDataSource>(() => _i654.ProfileApiDataSource());
    gh.singleton<_i313.SuggestionCubit>(
        () => _i313.SuggestionCubit(gh<_i991.SuggestionRepository>()));
    gh.singleton<_i806.MoviesRepository>(
        () => _i806.MoviesRepository(gh<_i992.MoviesDataSource>()));
    gh.singleton<_i364.ProfileRepository>(
        () => _i364.ProfileRepository(gh<_i423.ProfileDataSource>()));
    gh.singleton<_i28.AuthRepositorie>(() => _i186.AuthRepositorieImpl(
          gh<_i94.AuthRemoteDataSource>(),
          gh<_i147.AuthLocalDataSource>(),
        ));
    gh.singleton<_i790.MoviesCubit>(
        () => _i790.MoviesCubit(gh<_i806.MoviesRepository>()));
    gh.singleton<_i298.MoviesGenreCubit>(
        () => _i298.MoviesGenreCubit(gh<_i806.MoviesRepository>()));
    gh.singleton<_i625.ProfileCubit>(
        () => _i625.ProfileCubit(gh<_i364.ProfileRepository>()));
    gh.singleton<_i489.AuthCubit>(
        () => _i489.AuthCubit(gh<_i28.AuthRepositorie>()));
    return this;
  }
}
