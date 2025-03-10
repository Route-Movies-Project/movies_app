import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class SuggestionDataSource {
  Future<MoviesResponse> getSuggestionMovies(int movieId);
}