import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/cubit/suggestion_states.dart';
import 'package:movies_app/features/movie_detials/repository/suggestion_repository.dart';

@singleton
class SuggestionCubit extends Cubit<SuggestionStates> {
  final SuggestionRepository _suggestionRepository;
  List<Movie> suggestionMovies = [];
  SuggestionCubit(this._suggestionRepository) : super(SuggestionInitial());

  Future<void> getSuggestionMovies(int movieId) async {
    emit(SuggestionLoading());
    final response = await _suggestionRepository.getSuggestionMovies(movieId);
    response.fold(
      (l) => emit(SuggestionError(errorMessage: l.message)),
      (r) {
        suggestionMovies = r.data?.movies ?? [];
        emit(SuggestionSuccess(suggestionMovies));
      },
    );
  }
}
