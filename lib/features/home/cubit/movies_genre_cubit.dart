import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/cubit/movies_states.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/repository/movies_repository.dart';

class MoviesGenreCubit extends Cubit<MoviesStates> {
  MoviesGenreCubit(this._moviesRepository) : super(MoviesInitial());
  List<Movie> genreMovies = [];
  final MoviesRepository _moviesRepository;
  Future<void> getGenreMovies(int limit, int page, String genre) async {
    emit(MoviesGenreLoading());
    final response = await _moviesRepository.getGenreMovies(limit, page, genre);

    response.fold(
      (l) => emit(MoviesGenreError(errorMessage: l.message)),
      (r) {
        genreMovies = r.data?.movies ?? [];
        emit(
          MoviesGenreSuccess(genreMovies),
        );
      },
    );
  }
}
