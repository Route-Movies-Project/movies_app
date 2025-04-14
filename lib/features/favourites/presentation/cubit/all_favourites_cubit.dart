import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/favourites/domain/entities/favourit_movie.dart';
import 'package:movies_app/features/favourites/domain/use_case/get_favourite.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';

@singleton
class AllFavouritesCubit extends Cubit<FavouritesStates> {
  AllFavouritesCubit(this._getFavourite) : super(FavouritesInitial());
  final GetFavouriteUseCase _getFavourite;
  List<FavouriteMovie> allFavouriteMovies = [];
  Future<void> getAllFavouriteMovies() async {
    emit(AllFavouriteMoviesLoading());
    final response = await _getFavourite();
    response.fold(
      (l) {
        emit(
          AllFavouriteMoviesError(l.message),
        );
      },
      (r) {
        allFavouriteMovies = r;
        emit(
          AllFavouriteMoviesSuccess(
            allFavouriteMovies,
          ),
        );
      },
    );
  }
}
