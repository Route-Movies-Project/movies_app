import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/data/data_source/suggestion_data_source.dart';

@singleton
class SuggestionRepository {
  final SuggestionDataSource _suggestionMoviesDataSource;

  SuggestionRepository(this._suggestionMoviesDataSource);

  Future<Either<Faliure, MoviesResponse>> getSuggestionMovies(
      int movieId) async {
    try {
      final response =
          await _suggestionMoviesDataSource.getSuggestionMovies(movieId);
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
