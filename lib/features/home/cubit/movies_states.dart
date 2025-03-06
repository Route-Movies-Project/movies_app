import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class MoviesStates {}

class MoviesInitial extends MoviesStates {}

class MoviesLoading extends MoviesStates {}

class MoviesSuccess extends MoviesStates {
  final List<Movie> movies;

  MoviesSuccess(this.movies);
}

class MoviesError extends MoviesStates {
  final String errorMessage;

  MoviesError({required this.errorMessage});
}

class MoviesGenreLoading extends MoviesStates {}

class MoviesGenreSuccess extends MoviesStates {
  final List<Movie> movies;

  MoviesGenreSuccess(this.movies);
}

class MoviesGenreError extends MoviesStates {
  final String errorMessage;

  MoviesGenreError({required this.errorMessage});
}
