import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_detials/repository/movie_details_repository.dart';

@singleton
class SuggestionCubit extends Cubit<MovieDetailsStates> {
  final MovieDetailsRepository _movieDetailsRepository;
  List<Movie> suggestionMovies = [];
  SuggestionCubit(this._movieDetailsRepository) : super(MovieDetailsInitial());

  Future<void> getSuggestionMovies(int movieId) async {
    emit(SuggestionLoading());
    final response = await _movieDetailsRepository.getSuggestionMovies(movieId);

    response.fold(
      (l) => emit(SuggestionError(errorMessage: l.message)),
      (r) {
        suggestionMovies = r.data?.movies ?? [];
        emit(SuggestionSuccess(suggestionMovies));
      },
    );
  }
}
