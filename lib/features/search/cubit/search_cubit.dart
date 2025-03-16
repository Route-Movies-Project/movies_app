import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/search/cubit/search_states.dart';
import 'package:movies_app/features/search/repo/search_repo.dart';

@singleton
class SearchCubit extends Cubit<SearchMoviesStates> {
  SearchCubit(this._searchRepository) : super(SearchMoviesInitial());
  final SearchRepository _searchRepository;
  List<Movie> allMovies = [];

  Future<void> searchMovies(String query) async {
    emit(SearchMoviesLoading());
    final response = await _searchRepository.searchMovies(query);
    response.fold(
      (l) => emit(SearchMoviesError(l.message)),
      (r) {
        allMovies = r.data?.movies ?? [];
        emit(
          SearchMoviesSuccess(allMovies),
        );
      },
    );
  }

  void resetSearchResults() {
    emit(SearchMoviesInitial());
  }
  
}
