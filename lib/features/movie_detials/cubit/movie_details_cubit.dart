import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_detials/repository/movie_details_repository.dart';

@singleton
class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  MovieDetailsCubit(this._movieDetailsRepository)
      : super(MovieDetailsInitial());
  final MovieDetailsRepository _movieDetailsRepository;
  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    final response = await _movieDetailsRepository.getMovieDetails(movieId);
    response.fold(
      (l) => emit(
        MovieDetailsError(
          errorMessage: l.message,
        ),
      ),
      (r) => emit(
        MovieDetailsSuccess(r),
      ),
    );
  }
}
