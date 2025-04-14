import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/favourites/domain/repository/favourite_repository.dart';

@singleton
class IsFavouriteUseCase {
  final FavouriteRepository _favouriteRepository;

  IsFavouriteUseCase(this._favouriteRepository);
  Future<Either<Faliure, bool>> call(int movieId) =>
      _favouriteRepository.getIsFavourite(movieId);
}
