import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_detials/cubit/suggestions_cubit.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_similar_movies.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/movie_suggestion_loading_widget.dart';

class MovieSuggestionWidget extends StatelessWidget {
  const MovieSuggestionWidget({
    super.key,
    required this.suggestionMoviesCubit,
    required this.movieDetailsCubit,
    required this.scrollController,
  });
  final SuggestionCubit suggestionMoviesCubit;
  final MovieDetailsCubit movieDetailsCubit;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionCubit, MovieDetailsStates>(
      bloc: suggestionMoviesCubit,
      builder: (context, state) {
        if (state is SuggestionLoading) {
          return const MovieSuggestionLoadingWidget();
        } else if (state is SuggestionError) {
          return ErrorWidget(state.errorMessage);
        } else if (state is SuggestionSuccess) {
          List<Movie> suggestionMovies = state.movies;
          return CustomSimilarMovies(
            movieDetailsCubit: movieDetailsCubit,
            suggestionMovies: suggestionMovies,
            suggestionMoviesCubit: suggestionMoviesCubit,
            scrollController: scrollController,
          );
        } else {
          return const SizedBox(
            child: Text('No similar movies found'),
          );
        }
      },
    );
  }
}
