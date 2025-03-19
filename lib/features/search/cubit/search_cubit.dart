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
  bool isLoading = false;
  bool hasMoreData = true;
  int page = 1;
  Future<void> searchMovies(
    String query,
    int limit, {
    bool isPagination = false,
  }) async {
    if (isLoading || !hasMoreData) return;
    isLoading = true;
    if (!isPagination) {
      emit(SearchMoviesLoading());
      page = 1;
      hasMoreData = true;
      allMovies.clear();
    }
    final response = await _searchRepository.searchMovies(query, page, limit);
    response.fold(
      (l) {
        emit(SearchMoviesError(l.message));
        isLoading = false;
      },
      (r) {
        allMovies.addAll(r.data?.movies ?? []);
        page++;
        hasMoreData = r.data?.movies.length == limit;
        emit(
          SearchMoviesSuccess(allMovies),
        );
        isLoading = false;
      },
    );
  }

  void resetSearchResults() {
    emit(SearchMoviesInitial());
  }
}
