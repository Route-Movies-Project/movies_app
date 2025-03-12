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
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_card.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/suggestions_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_cast_card.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_genre_card.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_title.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/info_card.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/movie_suggestion_loading_widget.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/screenshot_item.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = '/movie-details';
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final suggestionMoviesCubit = getIt<SuggestionCubit>();
  final movieDetailsCubit = getIt<MovieDetailsCubit>();
  late Movie movie;
  bool isAssigned = false;
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    if (!isAssigned) {
      movie = ModalRoute.of(context)!.settings.arguments as Movie;
      movieDetailsCubit.getMovieDetails(movie.id);
      suggestionMoviesCubit.getSuggestionMovies(movie.id);
      isAssigned = true;
    }
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<MovieDetailsCubit>(),
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
                        // Background Image
                        CachedNetworkImage(
                          imageUrl: movieDetails.largeCoverImage == null ||
                                  movieDetails.largeCoverImage.isEmpty
                              ? movieDetails.mediumCoverImage
                              : movieDetails.largeCoverImage,
                          fadeInDuration: const Duration(seconds: 1),
                          fadeOutDuration: const Duration(seconds: 1),
                          fadeInCurve: Curves.easeIn,
                          fadeOutCurve: Curves.easeOut,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: const Color(0xFF121312),
                            highlightColor: Colors.grey.shade700,
                            child: Container(
                              width: double.infinity,
                              height: 645.h,
                              decoration: const BoxDecoration(
                                color: Color(0xFF121312),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: ThemeColors.yellow,
                          ),
                          fit: BoxFit.cover,
                          height: 645.h,
                          width: double.infinity,
                        ),
                        // Gradient Overlay
                        Container(
                          width: double.infinity,
                          height: 645.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ThemeColors.black.withValues(alpha: 0.2),
                                ThemeColors.black.withValues(alpha: 0.1),
                                ThemeColors.black,
                              ],
                            ),
                          ),
                        ),
                        // Content
                        SafeArea(
                          child: SizedBox(
                            height: 645.h,
                            child: Column(
                              children: [
                                // App Bar
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 37.w,
                                        height: 58.h,
                                        decoration: BoxDecoration(
                                          color: Colors.black
                                              .withValues(alpha: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: IconButton(
                                          icon:
                                              const Icon(Icons.arrow_back_ios),
                                          color: ThemeColors.white,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 50.w,
                                        height: 58.h,
                                        decoration: BoxDecoration(
                                          color: Colors.black
                                              .withValues(alpha: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: IconButton(
                                          icon:
                                              const Icon(Icons.bookmark_border),
                                          color: ThemeColors.white,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 210.h),
                                // Play Button
                                SvgPicture.asset(AppAssets.playTap),
                                // Spacer for main content
                                const Spacer(),

                                SizedBox(height: 20.h),

                                // Movie Title
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Text(
                                    movieDetails.title,
                                    textAlign: TextAlign.center,
                                    style: HelperFunction.textTheme(context)
                                        .titleLarge,
                                  ),
                                ),

                                SizedBox(height: 10.h),

                                // Year
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: CustomElevatedButton(
                        onPressed: () {
                          // handle watch button
                          launchUrl(
                            Uri.parse(movieDetails.url),
                          );
                        },
                        buttonStyle: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 55.h),
                          backgroundColor: ThemeColors.red,
                          foregroundColor: ThemeColors.white,
                        ),
                        child: const Text('Watch'),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // Rating Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoCard(
                          text: movieDetails.torrents.length.toString(),
                          icon: Icons.favorite,
                        ),
                        InfoCard(
                          text: movieDetails.runtime.toString(),
                          icon: Icons.timelapse,
                        ),
                        InfoCard(
                          text: movieDetails.rating.toString(),
                          icon: Icons.star,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    const CustomTitle(titleName: 'Screenshots'),
                    SizedBox(height: 10.h),
                    ScreenshotItem(
                      imgeUrl: movieDetails.largeCoverImage == null ||
                              movieDetails.largeCoverImage.isEmpty
                          ? movieDetails.mediumCoverImage
                          : movieDetails.largeCoverImage,
                    ),
                    ScreenshotItem(
                      imgeUrl: movieDetails.largeCoverImage,
                    ),
                    ScreenshotItem(
                      imgeUrl: movieDetails.largeCoverImage,
                    ),
                    SizedBox(height: 20.h),
                    // Similar Movies
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
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: suggestionMovies.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 20.w,
                                childAspectRatio: 189.w / 279.h,
                              ),
                              itemBuilder: (context, index) {
                                return CustomCard(
                                  onTap: () {
                                    scrollController.animateTo(
                                      0.0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                    suggestionMoviesCubit.getSuggestionMovies(
                                      suggestionMovies[index].id,
                                    );
                                    movieDetailsCubit.getMovieDetails(
                                      suggestionMovies[index].id,
                                    );
                                  },
                                  customWidth: 189.w,
                                  customHeight: 279.h,
                                  movie: suggestionMovies[index],
                                );
                              },
                            ),
                          );
                        } else {
                          return const SizedBox(
                            child: Text('No similar movies found'),
                          );
                        }
                      },
                    ),

                    SizedBox(height: 16.h),
                    const CustomTitle(titleName: 'Summary'),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          movieDetails.descriptionIntro == ''
                              ? 'No summary available'
                              : movieDetails.descriptionIntro,
                          style: HelperFunction.textTheme(context).bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    const CustomTitle(titleName: 'Cast'),
                    SizedBox(height: 13.h),
                    const CustomCastCard(
                      imageName: 'assets/images/HayleyAtwell.png',
                      actorName: 'HayleyAtwell',
                      characterName: 'Captain Carter',
                    ),
                    SizedBox(height: 8.h),
                    const CustomCastCard(
                      imageName: 'assets/images/HayleyAtwell.png',
                      actorName: 'HayleyAtwell',
                      characterName: 'Captain Carter',
                    ),
                    SizedBox(height: 8.h),
                    const CustomCastCard(
                      imageName: 'assets/images/HayleyAtwell.png',
                      actorName: 'HayleyAtwell',
                      characterName: 'Captain Carter',
                    ),
                    SizedBox(height: 8.h),
                    const CustomCastCard(
                      imageName: 'assets/images/HayleyAtwell.png',
                      actorName: 'HayleyAtwell',
                      characterName: 'Captain Carter',
                    ),
                    SizedBox(height: 16.h),
                    const CustomTitle(titleName: 'Genres'),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 16.h, left: 16.w, right: 16.w),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: movieDetails.genres.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 11.h,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 122.w / 36.h,
                        ),
                        itemBuilder: (context, index) {
                          return CustomGenreCard(
                            genreName: movieDetails.genres[index],
                          );
                        },
                      ),
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
