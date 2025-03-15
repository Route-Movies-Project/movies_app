import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/favourites/data_source/data/favourites_data_source.dart';
import 'package:movies_app/features/favourites/data_source/model/favourites_request.dart';

@singleton
class FavouritesRepository {
  final FavouritesDataSource _favouritesDataSource;

  FavouritesRepository(this._favouritesDataSource);

  Future<Either<Faliure, String>> addToFavourite(
    FavouriteModel favouriteModel,
  ) async {
    try {
      final response =
          await _favouritesDataSource.addToFavourite(favouriteModel);
      return Right(response.message);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  Future<Either<Faliure, String>> deleteFavourite(int movieId) async {
    try {
      final response = await _favouritesDataSource.deleteFavourite(movieId);
      return Right(response.message);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  Future<Either<Faliure, bool>> getIsFavourite(int movieId) async {
    try {
      final response = await _favouritesDataSource.getIsFavourite(movieId);
      return Right(response.data);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
