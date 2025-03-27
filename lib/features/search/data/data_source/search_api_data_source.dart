import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/search/data/data_source/search_data_source.dart';

@Singleton(as: SearchDataSource)
class MoviesApiDataSource implements SearchDataSource {
  final Dio _movieDio;

  MoviesApiDataSource(@Named('MovieDio') this._movieDio);

  @override
  Future<MoviesResponse> searchMovies(
    String query,
    int page,
    int limit,
  ) async {
    try {
      final response = await _movieDio.get(
        ApiConstants.moviesListEndPoint,
        queryParameters: {
          "query_term": query,
          "limit": limit.toString(),
          "page": page.toString(),
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
