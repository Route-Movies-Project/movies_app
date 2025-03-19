import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/home/data/data_source/movies_data_source.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';

@singleton
class MoviesRepository {
  final MoviesDataSource _moviesDataSource;

  MoviesRepository(this._moviesDataSource);

  Future<Either<Faliure, MoviesResponse>> getMovies(
    int limit,
    int page,
  ) async {
    try {
      final response = await _moviesDataSource.getMovies(limit, page);
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  Future<Either<Faliure, MoviesResponse>> getGenreMovies(
    int limit,
    int page,
    String genre,
  ) async {
    try {
      final response =
          await _moviesDataSource.getGenreMovies(limit, page, genre);
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
