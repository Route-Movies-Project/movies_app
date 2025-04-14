import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/data/repository/favourites_repository_impl.dart';

@singleton
class IsFavouriteCubit extends Cubit<FavouritesStates> {
  IsFavouriteCubit(this._favouritesRepository) : super(FavouritesInitial());
  final FavouritesRepositoryImpl _favouritesRepository;
  void setLoading() {
    emit(IsFavouriteLoading());
  }

  Future<void> getIsFavourite(int movieId) async {
    emit(IsFavouriteLoading());
    final response = await _favouritesRepository.getIsFavourite(movieId);

    response.fold(
      (l) => emit(
        IsFavouritesError(l.message),
      ),
      (r) => emit(
        IsFavouriteSuccess(r),
      ),
    );
  }
}
