import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/presentation/cubit/is_favourite_cubit.dart';
import 'package:movies_app/features/favourites/repository/favourites_repository.dart';

@singleton
class DeleteFavouriteCubit extends Cubit<FavouritesStates> {
  DeleteFavouriteCubit(this._favouritesRepository) : super(FavouritesInitial());
  final FavouritesRepository _favouritesRepository;
  Future<void> deleteFavouirte(int movieId) async {
    emit(DeleteFavouriteLoading());
    getIt<IsFavouriteCubit>().emit(IsFavouriteLoading());
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
