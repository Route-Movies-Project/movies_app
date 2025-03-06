import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/home/data/data_source/movies_api_data_source.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';

class MoviesRepository {
  final MoviesApiDataSource _moviesApiDataSource;

  MoviesRepository(this._moviesApiDataSource);

  Future<Either<Faliure, MoviesResponse>> getMovies() async {
    try {
      final response = await _moviesApiDataSource.getMovies();
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
          await _moviesApiDataSource.getGenreMovies(limit, page, genre);
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
