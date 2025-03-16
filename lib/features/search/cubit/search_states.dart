import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class SearchMoviesStates {}

class SearchMoviesInitial extends SearchMoviesStates {}

class SearchMoviesLoading extends SearchMoviesStates {}

class SearchMoviesSuccess extends SearchMoviesStates {
  final List<Movie> movies;

  SearchMoviesSuccess(this.movies);
}

class SearchMoviesError extends SearchMoviesStates {
  final String errorMessage;

  SearchMoviesError(this.errorMessage);
}


