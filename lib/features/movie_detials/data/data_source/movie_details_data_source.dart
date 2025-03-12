import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';

abstract class MovieDetailDataSource {
  Future<MoviesResponse> getSuggestionMovies(int movieId);
  Future<MovieDetailsResponse> getMovieDetails(int movieId);
}
