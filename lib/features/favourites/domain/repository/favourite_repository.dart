import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/favourites/data/model/favourites_request.dart';
import 'package:movies_app/features/favourites/domain/entities/favourit_movie.dart';

abstract class FavouriteRepository {
  Future<Either<Faliure, String>> addToFavourite(FavouriteModel favouriteModel);
  Future<Either<Faliure, String>> deleteFavourite(int movieId);
  Future<Either<Faliure, bool>> getIsFavourite(int movieId);
  Future<Either<Faliure, List<FavouriteMovie>>> getAllFavourites();
}
