import 'package:movies_app/features/home/data/model/movie_response.dart';

abstract class SuggestionStates {}

class SuggestionInitial extends SuggestionStates {}

class SuggestionLoading extends SuggestionStates {}

class SuggestionError extends SuggestionStates {
  final String errorMessage;
  SuggestionError( {required this.errorMessage});
}

class SuggestionSuccess extends SuggestionStates {
  final List<Movie> movies;
  SuggestionSuccess(this.movies);
}