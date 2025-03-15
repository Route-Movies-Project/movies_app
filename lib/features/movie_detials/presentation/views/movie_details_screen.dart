// ignore_for_file: unnecessary_null_comparison
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/favourites/data_source/model/favourites_request.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_card.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/suggestions_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_arrow_back.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_description.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_genre.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_genre_card.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_gradient.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_info_row.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_movie_title.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_network_image.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_screenshot.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_similar_movies.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_title.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_watch_button.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/info_card.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/movie_suggestion_loading_widget.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/screenshot_item.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = '/movie-details';
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final suggestionMoviesCubit = getIt<SuggestionCubit>();
  final movieDetailsCubit = getIt<MovieDetailsCubit>();
  final favouritesCubit = getIt<FavouritesCubit>();
  late Movie movie;
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
      movie = ModalRoute.of(context)!.settings.arguments as Movie;
      movieDetailsCubit.getMovieDetails(movie.id);
      suggestionMoviesCubit.getSuggestionMovies(movie.id);
      favouritesCubit.getIsFavourite(movie.id);
      isAssigned = true;
    }
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: getIt<MovieDetailsCubit>(),
          ),
          BlocProvider.value(
            value: getIt<FavouritesCubit>(),
          ),
        ],
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
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
                    Stack(
                      children: [
                        CustomNetworkImage(movieDetails: movieDetails),
                        const CustomGradient(),
                        SafeArea(
                          child: SizedBox(
                            height: 645.h,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomArrowBack(),
                                      Container(
                                        width: 50.w,
                                        height: 58.h,
                                        decoration: BoxDecoration(
                                          color: Colors.black
                                              .withValues(alpha: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        child: BlocListener<FavouritesCubit,
                                            FavouritesStates>(
                                          listener: (context, state) {
                                            if (state is FavouritesLoading) {
                                            } else if (state
                                                is FavouritesError) {
                                              Fluttertoast.showToast(
                                                msg: state.errorMessage,
                                                backgroundColor:
                                                    ThemeColors.yellow,
                                                toastLength: Toast.LENGTH_SHORT,
                                                textColor: ThemeColors.black,
                                                gravity: ToastGravity.BOTTOM,
                                              );
                                            } else if (state
                                                is FavouritesSuccess) {
                                              Fluttertoast.showToast(
                                                msg: state.addToFavouritemessage ==
                                                        null
                                                    ? state.deleteFavouritemessage ??
                                                        ""
                                                    : "",
                                                backgroundColor:
                                                    ThemeColors.yellow,
                                                toastLength: Toast.LENGTH_SHORT,
                                                textColor: ThemeColors.black,
                                                gravity: ToastGravity.BOTTOM,
                                              );
                                              isFavourite =
                                                  state.isFavourite ?? false;
                                            }
                                          },
                                          child: IconButton(
                                            icon: const Icon(
                                                Icons.bookmark_border),
                                            color: ThemeColors.white,
                                            onPressed: () {
                                              getIt<FavouritesCubit>()
                                                  .getIsFavourite(movie.id);
                                              if (!isFavourite) {
                                                getIt<FavouritesCubit>()
                                                    .addToFavourite(
                                                  FavouriteModel(
                                                    movieId:
                                                        movie.id.toString(),
                                                    name: movie.title,
                                                    rating: movie.rating,
                                                    imageUrl:
                                                        movie.largeCoverImage,
                                                    year: movie.year.toString(),
                                                  ),
                                                );
                                              } else {
                                                getIt<FavouritesCubit>()
                                                    .deleteFavouirte(
                                                  movie.id,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 210.h),
                                SvgPicture.asset(AppAssets.playTap),
                                const Spacer(),
                                SizedBox(height: 20.h),
                                CustomMovieTitle(movieDetails: movieDetails),
                                SizedBox(height: 10.h),
                                Text(
                                  movieDetails.year.toString(),
                                  style: HelperFunction.textTheme(context)
                                      .bodyMedium,
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomWatchButton(movieDetails: movieDetails),
                    SizedBox(height: 20.h),
                    CustomInfoRow(movieDetails: movieDetails),
                    SizedBox(height: 20.h),
                    const CustomTitle(titleName: 'Screenshots'),
                    SizedBox(height: 10.h),
                    CustomScreenshot(movieDetails: movieDetails),
                    SizedBox(height: 20.h),
                    const CustomTitle(titleName: 'Similar Movies'),
                    BlocBuilder<SuggestionCubit, MovieDetailsStates>(
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
                    ),
                    const CustomTitle(titleName: 'Summary'),
                    SizedBox(height: 8.h),
                    CustomDescription(movieDetails: movieDetails),
                    SizedBox(height: 20.h),
                    const CustomTitle(titleName: 'Genres'),
                    SizedBox(height: 16.h),
                    CustomGenre(movieDetails: movieDetails),
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
