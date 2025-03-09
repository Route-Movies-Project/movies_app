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

  Future<void> getMovies() async {
    emit(MoviesLoading());
    final response = await _moviesRepository.getMovies();

    response.fold(
      (l) => emit(MoviesError(errorMessage: l.message)),
      (r) {
        allMovies = r.data?.movies ?? [];
        emit(
          MoviesSuccess(allMovies),
        );
      },
    );
  }
}
