import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:movies_app/features/home/data/data_source/movies_data_source.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';

@Singleton(as: MoviesDataSource)
class MoviesApiDataSource implements MoviesDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.basicYtsUrl,
      receiveDataWhenStatusError: true,
    ),
  );
  @override
  Future<MoviesResponse> getMovies() async {
    try {
      final response = await _dio.get(
        ApiConstants.moviesListEndPoint,
      );
      if (response.statusCode == 200) {
        return MoviesResponse.fromJson(response.data);
      } else {
        throw const RemoteExpetion("Failed to get Movies");
      }
    } on DioException catch (error) {
      throw RemoteExpetion(error.response!.data["status_message"] ?? '');
    }
  }

  @override
  Future<MoviesResponse> getGenreMovies(
    int limit,
    int page,
    String genre,
  ) async {
    try {
      final response = await _dio.get(
        ApiConstants.moviesListEndPoint,
        queryParameters: {
          "limit": limit.toString(),
          "page": page.toString(),
          "genre": genre.toString(),
          "with_rt_ratings": "true",
        },
      );
      if (response.statusCode == 200) {
        return MoviesResponse.fromJson(response.data);
      } else {
        throw const RemoteExpetion("Failed to get Movies");
      }
    } on DioException catch (error) {
      throw RemoteExpetion(error.response!.data["status_message"] ?? '');
    }
  }
}
