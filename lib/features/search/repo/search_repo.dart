import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/search/data/data_source/search_data_source.dart';

@singleton
class SearchRepository {
  final SearchDataSource _searchDataSource;

  SearchRepository(this._searchDataSource);

  Future<Either<Faliure, MoviesResponse>> searchMovies( String query) async {
    try {
      final response = await _searchDataSource.searchMovies(query);
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

}
