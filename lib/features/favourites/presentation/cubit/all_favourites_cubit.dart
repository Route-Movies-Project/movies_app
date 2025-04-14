import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/favourites/domain/entities/favourit_movie.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/data/repository/favourites_repository_impl.dart';

@singleton
class AllFavouritesCubit extends Cubit<FavouritesStates> {
  AllFavouritesCubit(this._favouritesRepository) : super(FavouritesInitial());
  final FavouritesRepositoryImpl _favouritesRepository;
  List<FavouriteMovie> allFavouriteMovies = [];
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
