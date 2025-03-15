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
