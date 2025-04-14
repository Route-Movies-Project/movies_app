import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/favourites/data/model/favourites_request.dart';
import 'package:movies_app/features/favourites/domain/use_case/add_to_favourite.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';

@singleton
class AddToFavouritesCubit extends Cubit<FavouritesStates> {
  AddToFavouritesCubit(this._addToFavourite) : super(FavouritesInitial());
  final AddToFavouriteUseCase _addToFavourite;
  Future<void> addToFavourite(FavouriteModel favouriteModel) async {
    emit(FavouritesLoading());
    final response = await _addToFavourite(favouriteModel);
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
