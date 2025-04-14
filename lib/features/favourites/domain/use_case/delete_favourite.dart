import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/favourites/domain/repository/favourite_repository.dart';

@singleton
class DeleteFavouriteUseCase {
  final FavouriteRepository _favouriteRepository;

  DeleteFavouriteUseCase(this._favouriteRepository);
  Future<Either<Faliure, String>> call(int movieId) =>
      _favouriteRepository.deleteFavourite(movieId);
}
