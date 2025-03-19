import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/home/cubit/movies_states.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/repository/movies_repository.dart';

@singleton
class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit(this._moviesRepository) : super(MoviesInitial());
  final MoviesRepository _moviesRepository;
  List<Movie> allMovies = [];
  int page = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  Future<void> getMovies(
    int limit, {
    bool isPagination = false,
  }) async {
    if (isLoading || !hasMoreData) return;
    isLoading = true;
    if (!isPagination) {
      emit(MoviesLoading());
      hasMoreData == true;
      page = 1;
      allMovies.clear();
    }
    final response = await _moviesRepository.getMovies(limit, page);

    response.fold(
      (l) {
        emit(
          MoviesError(
            errorMessage: l.message,
          ),
        );
        isLoading = false;
      },
      (r) {
        allMovies.addAll(r.data?.movies ?? []);
        page++;

        hasMoreData = r.data?.movies.length == limit;
        emit(
          MoviesSuccess(allMovies),
        );
        isLoading = false;
      },
    );
  }
}
