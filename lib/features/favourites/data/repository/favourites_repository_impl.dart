import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/favourites/data/data_source/favourites_data_source.dart';
import 'package:movies_app/features/favourites/data/mappers/delete_movie_mapper.dart';
import 'package:movies_app/features/favourites/data/mappers/favourite_movie_mapper.dart';
import 'package:movies_app/features/favourites/data/mappers/is_favourite_mapper.dart';
import 'package:movies_app/features/favourites/data/model/favourites_request.dart';
import 'package:movies_app/features/favourites/domain/entities/favourit_movie.dart';
import 'package:movies_app/features/favourites/domain/repository/favourite_repository.dart';

@Singleton(as: FavouriteRepository)
class FavouritesRepositoryImpl implements FavouriteRepository {
  final FavouritesDataSource _favouritesDataSource;

  FavouritesRepositoryImpl(this._favouritesDataSource);

  @override
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

  @override
  Future<Either<Faliure, String>> deleteFavourite(int movieId) async {
    try {
      final response = await _favouritesDataSource.deleteFavourite(movieId);
      return Right(response.toEntity.message);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, bool>> getIsFavourite(int movieId) async {
    try {
      final response = await _favouritesDataSource.getIsFavourite(movieId);
      return Right(response.toEntity.data);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, List<FavouriteMovie>>> getAllFavourites() async {
    try {
      final response = await _favouritesDataSource.getAllFavouriteMovies();
      return Right(
        response.data.map((favourite) => favourite.toEntity).toList(),
      );
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
