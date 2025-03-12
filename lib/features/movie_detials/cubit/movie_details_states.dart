import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';

abstract class MovieDetailsStates {}

class MovieDetailsInitial extends MovieDetailsStates {}

class SuggestionLoading extends MovieDetailsStates {}

class SuggestionError extends MovieDetailsStates {
  final String errorMessage;
  SuggestionError({required this.errorMessage});
}

class SuggestionSuccess extends MovieDetailsStates {
  final List<Movie> movies;
  SuggestionSuccess(this.movies);
}

class MovieDetailsLoading extends MovieDetailsStates {}

class MovieDetailsError extends MovieDetailsStates {
  final String errorMessage;
  MovieDetailsError({required this.errorMessage});
}

class MovieDetailsSuccess extends MovieDetailsStates {
  final MovieDetails movies;
  MovieDetailsSuccess(this.movies);
}
