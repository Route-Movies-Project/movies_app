import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/home/cubit/movies_states.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/repository/movies_repository.dart';

@singleton
class MoviesGenreCubit extends Cubit<MoviesStates> {
  MoviesGenreCubit(this._moviesRepository) : super(MoviesInitial());

  final MoviesRepository _moviesRepository;
  bool isLoading = false;
  bool hasMoreData = true;
  List<Movie> genreMovies = [];
  int page = 1;

  Future<void> getGenreMovies(int limit, String genre,
      {bool isPagination = false}) async {
    if (isLoading || !hasMoreData) return;

    isLoading = true;

    if (!isPagination) {
      emit(MoviesGenreLoading());
      page = 1;
      hasMoreData = true;
      genreMovies.clear();
    }

    final response = await _moviesRepository.getGenreMovies(limit, page, genre);

    response.fold(
      (l) {
        emit(MoviesGenreError(errorMessage: l.message));
        isLoading = false;
      },
      (r) {
        genreMovies.addAll(r.data?.movies ?? []);
        page++;

        if (genreMovies.length < limit) {
          hasMoreData = false;
        }

        emit(MoviesGenreSuccess(genreMovies));
        isLoading = false;
      },
    );
  }
}
