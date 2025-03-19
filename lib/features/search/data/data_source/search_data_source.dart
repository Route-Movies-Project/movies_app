import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class SearchDataSource {
  Future<MoviesResponse> searchMovies(
    String query,
    int page,
    int limit,
  );
}
