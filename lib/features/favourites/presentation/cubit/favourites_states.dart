abstract class FavouritesStates {}

class FavouritesInitial extends FavouritesStates {}

class FavouritesLoading extends FavouritesStates {
  final bool addToFavouriteLoading;
  final bool deleteFavouriteLoading;
  final bool isFavouriteLoading;

  FavouritesLoading({
    this.addToFavouriteLoading = false,
    this.deleteFavouriteLoading = false,
    this.isFavouriteLoading = false,
  });
}

class FavouritesSuccess extends FavouritesStates {
  String? addToFavouritemessage;
  String? deleteFavouritemessage;
  bool? isFavourite;
  FavouritesSuccess({
    this.addToFavouritemessage,
    this.deleteFavouritemessage,
    this.isFavourite,
  });
}

class FavouritesError extends FavouritesStates {
  final String errorMessage;

  FavouritesError(this.errorMessage);
}
