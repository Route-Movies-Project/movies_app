import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/favourites/domain/use_case/is_favourite.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';

@singleton
class IsFavouriteCubit extends Cubit<FavouritesStates> {
  IsFavouriteCubit(this._isFavourite) : super(FavouritesInitial());
  final IsFavouriteUseCase _isFavourite;
  void setLoading() {
    emit(IsFavouriteLoading());
  }

  Future<void> getIsFavourite(int movieId) async {
    emit(IsFavouriteLoading());
    final response = await _isFavourite(movieId);

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
