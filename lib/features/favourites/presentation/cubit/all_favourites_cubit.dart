import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/favourites/data/model/all_favourites_response.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/repository/favourites_repository.dart';

@singleton
class AllFavouritesCubit extends Cubit<FavouritesStates> {
  AllFavouritesCubit(this._favouritesRepository) : super(FavouritesInitial());
  final FavouritesRepository _favouritesRepository;
  List<FavouriteMovieModel> allFavouriteMovies = [];
  Future<void> getAllFavouriteMovies() async {
    emit(AllFavouriteMoviesLoading());
    final response = await _favouritesRepository.getAllFavourites();
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
