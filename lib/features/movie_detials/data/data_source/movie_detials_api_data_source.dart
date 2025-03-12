import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/api_error_handler.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/data/data_source/movie_details_data_source.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';

@Singleton(as: MovieDetailDataSource)
class MovieDetailsApiDataSource implements MovieDetailDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.basicYtsUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<MoviesResponse> getSuggestionMovies(int movieId) async {
    try {
      final response = await _dio.get(
        ApiConstants.suggestionMoviesEndPoint,
        queryParameters: {
          "movie_id": movieId.toString(),
        },
      );

      return MoviesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteExpetion(e.toString());
    }
  }

  @override
  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get(
        ApiConstants.movieDetialsEndPoint,
        queryParameters: {
          "movie_id": movieId.toString(),
        },
      );
      return MovieDetailsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteExpetion(e.toString());
    }
  }
}
