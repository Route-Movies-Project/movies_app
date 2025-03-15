import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/favourites/data_source/model/favourites_request.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/repository/favourites_repository.dart';

@singleton
class FavouritesCubit extends Cubit<FavouritesStates> {
  FavouritesCubit(this._favouritesRepository) : super(FavouritesInitial());
  final FavouritesRepository _favouritesRepository;
  Future<void> addToFavourite(FavouriteModel favouriteModel) async {
    emit(FavouritesLoading(addToFavouriteLoading: true));
    final response = await _favouritesRepository.addToFavourite(favouriteModel);
    final currentState = state is FavouritesSuccess
        ? state as FavouritesSuccess
        : FavouritesSuccess();
    response.fold(
      (l) => Faliure(l.message),
      (r) => emit(
        FavouritesSuccess(
          addToFavouritemessage: r,
          deleteFavouritemessage: currentState.deleteFavouritemessage,
          isFavourite: currentState.isFavourite,
        ),
      ),
    );
  }

  Future<void> deleteFavouirte(int movieId) async {
    emit(FavouritesLoading(deleteFavouriteLoading: true));
    final response = await _favouritesRepository.deleteFavourite(movieId);
    final currentState = state is FavouritesSuccess
        ? state as FavouritesSuccess
        : FavouritesSuccess();
    response.fold(
      (l) => Faliure(l.message),
      (r) => emit(
        FavouritesSuccess(
          addToFavouritemessage: currentState.addToFavouritemessage,
          deleteFavouritemessage: r,
          isFavourite: currentState.isFavourite,
        ),
      ),
    );
  }

  Future<void> getIsFavourite(int movieId) async {
    emit(FavouritesLoading(addToFavouriteLoading: true));
    final response = await _favouritesRepository.getIsFavourite(movieId);
    final currentState = state is FavouritesSuccess
        ? state as FavouritesSuccess
        : FavouritesSuccess();
    response.fold(
      (l) => Faliure(l.message),
      (r) => emit(
        FavouritesSuccess(
          addToFavouritemessage: currentState.addToFavouritemessage,
          deleteFavouritemessage: currentState.deleteFavouritemessage,
          isFavourite: r,
        ),
      ),
    );
  }
}
