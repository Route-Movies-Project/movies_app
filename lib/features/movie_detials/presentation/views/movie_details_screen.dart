// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/features/favourites/presentation/cubit/is_favourite_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/suggestions_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_description.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_genre.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_header_image.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_info_row.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_screenshot.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_title.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_watch_button.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/movie_suggestion_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = '/movie-details';
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final suggestionMoviesCubit = getIt<SuggestionCubit>();
  final movieDetailsCubit = getIt<MovieDetailsCubit>();
  final isFavouriteCubit = getIt<IsFavouriteCubit>();
  late int movieId;
  bool isAssigned = false;
  bool isFavourite = false;
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isAssigned) {
      movieId = ModalRoute.of(context)!.settings.arguments as int;
      movieDetailsCubit.getMovieDetails(movieId);
      suggestionMoviesCubit.getSuggestionMovies(movieId);
      isFavouriteCubit.getIsFavourite(movieId);
      isAssigned = true;
    }
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return SizedBox.expand(
                child: Center(
                  child: Lottie.asset(
                    "assets/lottie/movielottie.json",
                    width: 200.w,
                    height: 200.w,
                  ),
                ),
              );
            } else if (state is MovieDetailsError) {
              return ErrorWidget(state.errorMessage);
            } else if (state is MovieDetailsSuccess) {
              MovieDetails movieDetails = state.movies;
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    CustomHeaderImage(
                      movieDetails: movieDetails,
                    ),
                    CustomWatchButton(
                      movieDetails: movieDetails,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomInfoRow(
                      movieDetails: movieDetails,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const CustomTitle(
                      titleName: 'Screenshots',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomScreenshot(
                      movieDetails: movieDetails,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const CustomTitle(
                      titleName: 'Similar Movies',
                    ),
                    MovieSuggestionWidget(
                      suggestionMoviesCubit: suggestionMoviesCubit,
                      movieDetailsCubit: movieDetailsCubit,
                      scrollController: scrollController,
                    ),
                    const CustomTitle(
                      titleName: 'Summary',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomDescription(
                      movieDetails: movieDetails,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const CustomTitle(
                      titleName: 'Genres',
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomGenre(
                      movieDetails: movieDetails,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
