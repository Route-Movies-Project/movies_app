import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/favourites/domain/entities/favourit_movie.dart';
import 'package:movies_app/features/favourites/domain/repository/favourite_repository.dart';

@singleton
class GetFavourite {
  final FavouriteRepository _favouriteRepository;

  GetFavourite(this._favouriteRepository);
  Future<Either<Faliure, List<FavouriteMovie>>> call() =>
      _favouriteRepository.getAllFavourites();
}
