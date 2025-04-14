import 'package:movies_app/features/favourites/domain/entities/favourit_movie.dart';

abstract class FavouritesStates {}

class FavouritesInitial extends FavouritesStates {}

class FavouritesLoading extends FavouritesStates {}

class FavouritesSuccess extends FavouritesStates {
  final String message;

  FavouritesSuccess(this.message);
}

class FavouritesError extends FavouritesStates {
  final String errorMessage;

  FavouritesError(this.errorMessage);
}

class DeleteFavouriteLoading extends FavouritesStates {}

class DeleteFavouriteSuccess extends FavouritesStates {
  final String message;

  DeleteFavouriteSuccess(this.message);
}

class DeleteFavouritesError extends FavouritesStates {
  final String errorMessage;

  DeleteFavouritesError(this.errorMessage);
}

class IsFavouriteLoading extends FavouritesStates {}

class IsFavouriteSuccess extends FavouritesStates {
  final bool isFavourite;

  IsFavouriteSuccess(this.isFavourite);
}

class IsFavouritesError extends FavouritesStates {
  final String errorMessage;

  IsFavouritesError(this.errorMessage);
}

class AllFavouriteMoviesLoading extends FavouritesStates {}

class AllFavouriteMoviesSuccess extends FavouritesStates {
  final List<FavouriteMovie> allFavouriteMovies;

  AllFavouriteMoviesSuccess(this.allFavouriteMovies);
}

class AllFavouriteMoviesError extends FavouritesStates {
  final String errorMessage;

  AllFavouriteMoviesError(this.errorMessage);
}
