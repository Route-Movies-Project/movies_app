import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/api_error_handler.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:movies_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:movies_app/features/favourites/data/data_source/favourites_data_source.dart';
import 'package:movies_app/features/favourites/data/model/all_favourites_response.dart';
import 'package:movies_app/features/favourites/data/model/delete_favourite_response.dart';
import 'package:movies_app/features/favourites/data/model/favourites_request.dart';
import 'package:movies_app/features/favourites/data/model/favourites_response.dart';
import 'package:movies_app/features/favourites/data/model/is_favourite_resposne.dart';

@Singleton(as: FavouritesDataSource)
class FavouriteApiDataSource implements FavouritesDataSource {
  final _dio = Dio(
    BaseOptions(
        baseUrl: ApiConstants.baseUrl, receiveDataWhenStatusError: true),
  );
  @override
  Future<FavouritesResponse> addToFavourite(
    FavouriteModel favouriteRequest,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.addToFavouriteEndPoint,
        data: favouriteRequest.toJson(),
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${await getIt<AuthLocalDataSource>().getToken()}",
          },
        ),
      );

      return FavouritesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteExpetion(e.toString());
    }
  }

  @override
  Future<DeleteFavouriteResposne> deleteFavourite(int movieId) async {
    try {
      final response = await _dio.delete(
        "${ApiConstants.deleteFavouriteEndPoint}/$movieId",
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${await getIt<AuthLocalDataSource>().getToken()}",
          },
        ),
      );
      return DeleteFavouriteResposne.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteExpetion(e.toString());
    }
  }

  @override
  Future<IsFavouriteRepsonse> getIsFavourite(int movieId) async {
    try {
      final response = await _dio.get(
        "${ApiConstants.isFavouriteEndPoint}/$movieId",
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${await getIt<AuthLocalDataSource>().getToken()}",
          },
        ),
      );

      return IsFavouriteRepsonse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteExpetion(e.toString());
    }
  }

  @override
  Future<AllFavouritesRepsonse> getAllFavouriteMovies() async {
    try {
      final response = await _dio.get(
        ApiConstants.allFavouritesEndPoint,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${await getIt<AuthLocalDataSource>().getToken()}",
          },
        ),
      );
      return AllFavouritesRepsonse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteExpetion(e.toString());
    }
  }
}
