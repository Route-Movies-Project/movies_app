import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/repository/favourites_repository.dart';

@singleton
class DeleteFavouriteCubit extends Cubit<FavouritesStates> {
  DeleteFavouriteCubit(this._favouritesRepository) : super(FavouritesInitial());
  final FavouritesRepository _favouritesRepository;
  Future<void> deleteFavouirte(int movieId) async {
    emit(DeleteFavouriteLoading());
    final response = await _favouritesRepository.deleteFavourite(movieId);

    response.fold(
      (l) => emit(
        DeleteFavouritesError(l.message),
      ),
      (r) => emit(
        DeleteFavouriteSuccess(r),
      ),
    );
  }
}
