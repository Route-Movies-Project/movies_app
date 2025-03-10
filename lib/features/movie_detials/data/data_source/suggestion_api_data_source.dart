import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/data/data_source/suggestion_data_source.dart';

@Singleton(as: SuggestionDataSource)
class SuggestionApiDataSource implements SuggestionDataSource {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.basicYtsUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<MoviesResponse> getSuggestionMovies(int movieId) async {
    try{
      final response = await _dio.get(ApiConstants.suggestionMoviesEndPoint,
        queryParameters: {
          "movie_id": movieId.toString(),
        },
      );
      if (response.statusCode == 200) {
        return MoviesResponse.fromJson(response.data);
      } else {
        throw const RemoteExpetion("Failed to get Movies");
      }
    }on  DioException catch(e){
      throw RemoteExpetion(e.response!.data["status_message"] ?? '');
    }

  }
}
