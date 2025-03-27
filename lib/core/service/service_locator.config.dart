// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_app/core/service/regsiter_module.dart' as _i351;
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
import 'package:movies_app/features/favourites/data/data_source/favourite_api_data_source.dart'
    as _i850;
import 'package:movies_app/features/favourites/data/data_source/favourites_data_source.dart'
    as _i37;
import 'package:movies_app/features/favourites/presentation/cubit/add_to_favourites_cubit.dart'
    as _i472;
import 'package:movies_app/features/favourites/presentation/cubit/all_favourites_cubit.dart'
    as _i212;
import 'package:movies_app/features/favourites/presentation/cubit/delete_favourite_cubit.dart'
    as _i70;
import 'package:movies_app/features/favourites/presentation/cubit/is_favourite_cubit.dart'
    as _i962;
import 'package:movies_app/features/favourites/repository/favourites_repository.dart'
    as _i847;
import 'package:movies_app/features/home/cubit/movie_genre_index_cubit.dart'
    as _i200;
import 'package:movies_app/features/home/cubit/movies_cubit.dart' as _i790;
import 'package:movies_app/features/home/cubit/movies_genre_cubit.dart'
    as _i298;
import 'package:movies_app/features/home/data/data_source/movies_api_data_source.dart'
    as _i579;
import 'package:movies_app/features/home/data/data_source/movies_data_source.dart'
    as _i992;
import 'package:movies_app/features/home/repository/movies_repository.dart'
    as _i806;
import 'package:movies_app/features/movie_detials/cubit/movie_details_cubit.dart'
    as _i230;
import 'package:movies_app/features/movie_detials/cubit/suggestions_cubit.dart'
    as _i562;
import 'package:movies_app/features/movie_detials/data/data_source/movie_details_data_source.dart'
    as _i1067;
import 'package:movies_app/features/movie_detials/data/data_source/movie_detials_api_data_source.dart'
    as _i995;
import 'package:movies_app/features/movie_detials/repository/movie_details_repository.dart'
    as _i692;
import 'package:movies_app/features/profile/cubit/profile_cubit.dart' as _i625;
import 'package:movies_app/features/profile/data/data_source/profile_api_data_source.dart'
    as _i654;
import 'package:movies_app/features/profile/data/data_source/profile_data_source.dart'
    as _i423;
import 'package:movies_app/features/profile/repository/profile_repository.dart'
    as _i364;
import 'package:movies_app/features/search/cubit/search_cubit.dart' as _i1018;
import 'package:movies_app/features/search/data/data_source/search_api_data_source.dart'
    as _i1042;
import 'package:movies_app/features/search/data/data_source/search_data_source.dart'
    as _i762;
import 'package:movies_app/features/search/repo/search_repo.dart' as _i568;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i200.MovieGenreIndexCubit>(
        () => _i200.MovieGenreIndexCubit());
    gh.singleton<_i361.Dio>(
      () => registerModule.movieDio,
      instanceName: 'MovieDio',
    );
    gh.singleton<_i147.AuthLocalDataSource>(
        () => _i381.AuthSharedPrefsDataSource(gh<_i460.SharedPreferences>()));
    gh.singleton<_i992.MoviesDataSource>(() => _i579.MoviesApiDataSource());
    gh.singleton<_i1067.MovieDetailDataSource>(() =>
        _i995.MovieDetailsApiDataSource(
            gh<_i361.Dio>(instanceName: 'MovieDio')));
    gh.singleton<_i762.SearchDataSource>(() =>
        _i1042.MoviesApiDataSource(gh<_i361.Dio>(instanceName: 'MovieDio')));
    gh.singleton<_i692.MovieDetailsRepository>(
        () => _i692.MovieDetailsRepository(gh<_i1067.MovieDetailDataSource>()));
    gh.singleton<_i361.Dio>(
      () => registerModule.mainDio,
      instanceName: 'MainDio',
    );
    gh.singleton<_i568.SearchRepository>(
        () => _i568.SearchRepository(gh<_i762.SearchDataSource>()));
    gh.singleton<_i806.MoviesRepository>(
        () => _i806.MoviesRepository(gh<_i992.MoviesDataSource>()));
    gh.singleton<_i1018.SearchCubit>(
        () => _i1018.SearchCubit(gh<_i568.SearchRepository>()));
    gh.singleton<_i94.AuthRemoteDataSource>(
        () => _i270.AuthApiDataSource(gh<_i361.Dio>(instanceName: 'MainDio')));
    gh.singleton<_i230.MovieDetailsCubit>(
        () => _i230.MovieDetailsCubit(gh<_i692.MovieDetailsRepository>()));
    gh.singleton<_i562.SuggestionCubit>(
        () => _i562.SuggestionCubit(gh<_i692.MovieDetailsRepository>()));
    gh.singleton<_i37.FavouritesDataSource>(() =>
        _i850.FavouriteApiDataSource(gh<_i361.Dio>(instanceName: 'MainDio')));
    gh.singleton<_i423.ProfileDataSource>(() =>
        _i654.ProfileApiDataSource(gh<_i361.Dio>(instanceName: 'MainDio')));
    gh.singleton<_i847.FavouritesRepository>(
        () => _i847.FavouritesRepository(gh<_i37.FavouritesDataSource>()));
    gh.singleton<_i790.MoviesCubit>(
        () => _i790.MoviesCubit(gh<_i806.MoviesRepository>()));
    gh.singleton<_i298.MoviesGenreCubit>(
        () => _i298.MoviesGenreCubit(gh<_i806.MoviesRepository>()));
    gh.singleton<_i364.ProfileRepository>(
        () => _i364.ProfileRepository(gh<_i423.ProfileDataSource>()));
    gh.singleton<_i28.AuthRepositorie>(() => _i186.AuthRepositorieImpl(
          gh<_i94.AuthRemoteDataSource>(),
          gh<_i147.AuthLocalDataSource>(),
        ));
    gh.singleton<_i472.AddToFavouritesCubit>(
        () => _i472.AddToFavouritesCubit(gh<_i847.FavouritesRepository>()));
    gh.singleton<_i212.AllFavouritesCubit>(
        () => _i212.AllFavouritesCubit(gh<_i847.FavouritesRepository>()));
    gh.singleton<_i70.DeleteFavouriteCubit>(
        () => _i70.DeleteFavouriteCubit(gh<_i847.FavouritesRepository>()));
    gh.singleton<_i962.IsFavouriteCubit>(
        () => _i962.IsFavouriteCubit(gh<_i847.FavouritesRepository>()));
    gh.singleton<_i625.ProfileCubit>(
        () => _i625.ProfileCubit(gh<_i364.ProfileRepository>()));
    gh.singleton<_i489.AuthCubit>(
        () => _i489.AuthCubit(gh<_i28.AuthRepositorie>()));
    return this;
  }
}

class _$RegisterModule extends _i351.RegisterModule {}
