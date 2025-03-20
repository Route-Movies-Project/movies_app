import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/favourites/data/model/favourites_request.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/repository/favourites_repository.dart';

@singleton
class AddToFavouritesCubit extends Cubit<FavouritesStates> {
  AddToFavouritesCubit(this._favouritesRepository) : super(FavouritesInitial());
  final FavouritesRepository _favouritesRepository;
  Future<void> addToFavourite(FavouriteModel favouriteModel) async {
    emit(FavouritesLoading());
    final response = await _favouritesRepository.addToFavourite(favouriteModel);
    response.fold(
      (failure) {
        emit(
          FavouritesError(
            failure.message,
          ),
        );
      },
      (success) {
        emit(FavouritesSuccess(success));
      },
    );
  }
}
