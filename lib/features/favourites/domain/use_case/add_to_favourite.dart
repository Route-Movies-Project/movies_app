import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/favourites/data/model/favourites_request.dart';
import 'package:movies_app/features/favourites/domain/repository/favourite_repository.dart';

@singleton
class AddToFavouriteUseCase {
  final FavouriteRepository _favouriteRepository;

  AddToFavouriteUseCase(this._favouriteRepository);
  Future<Either<Faliure, String>> call(FavouriteModel favouriteModel) =>
      _favouriteRepository.addToFavourite(favouriteModel);
}
