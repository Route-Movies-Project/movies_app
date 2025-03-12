import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/data/data_source/movie_details_data_source.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';

@singleton
class MovieDetailsRepository {
  final MovieDetailDataSource _movieDetialsDataSource;

  MovieDetailsRepository(this._movieDetialsDataSource);

  Future<Either<Faliure, MoviesResponse>> getSuggestionMovies(
      int movieId) async {
    try {
      final response =
          await _movieDetialsDataSource.getSuggestionMovies(movieId);
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  Future<Either<Faliure, MovieDetails>> getMovieDetails(
    int movieId,
  ) async {
    try {
      final response = await _movieDetialsDataSource.getMovieDetails(movieId);
      return Right(response.data.movie);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
