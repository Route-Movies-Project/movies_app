import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class MoviesDataSource {
  Future<MoviesResponse> getMovies(
    int limit,
    int page,
  );
  Future<MoviesResponse> getGenreMovies(
    int limit,
    int page,
    String genre,
  );
}
