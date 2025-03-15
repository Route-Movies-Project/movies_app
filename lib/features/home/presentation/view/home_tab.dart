import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/home/cubit/movies_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_genre_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_states.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_card.dart';
import 'package:movies_app/features/home/presentation/widgets/loading_genre_widget.dart';
import 'package:movies_app/features/home/presentation/widgets/loading_widget.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_genre.dart';
import 'package:movies_app/features/movie_detials/presentation/views/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'home_tab';
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomtTabState();
}

class _HomtTabState extends State<HomeTab> {
  final movieGenreCubit = getIt<MoviesGenreCubit>();
  int currentIndex = 0;
  String mygenre = "";
  final random = Random();
  void generateGenre() {
    String genre = MoviesGenre.movieGenres[random.nextInt(
      MoviesGenre.movieGenres.length,
    )];

    setState(() {
      mygenre = genre;
    });
  }

  bool isAssigned = false;
  @override
  void initState() {
    super.initState();
    generateGenre();
    movieGenreCubit.getGenreMovies(
      4,
      1,
      mygenre,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: RefreshIndicator(
            backgroundColor: ThemeColors.yellow,
            color: ThemeColors.black,
            onRefresh: () async {
              generateGenre();
              currentIndex = 0;
              await Future.wait([
                context.read<MoviesCubit>().getMovies(),
                movieGenreCubit.getGenreMovies(4, 1, mygenre),
              ]);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<MoviesCubit, MoviesStates>(
                    builder: (context, state) {
                      if (state is MoviesLoading) {
                        return const LoadingWidget();
                      } else if (state is MoviesError) {
                        return ErrorWidget(state.errorMessage);
                      } else if (state is MoviesSuccess) {
                        List<Movie> movies = state.movies;

                        return Stack(
                          children: [
                            Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      movies[currentIndex].largeCoverImage,
                                  fadeInDuration: const Duration(seconds: 1),
                                  fadeOutDuration: const Duration(seconds: 1),
                                  fadeInCurve: Curves.easeIn,
                                  fadeOutCurve: Curves.easeOut,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
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
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: ThemeColors.yellow,
                                  ),
                                  fit: BoxFit.cover,
                                  height: 645.h,
                                  width: double.infinity,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 645.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        ThemeColors.black
                                            .withValues(alpha: 0.8),
                                        ThemeColors.black
                                            .withValues(alpha: 0.6),
                                        ThemeColors.black,
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/availablenow.png"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: CarouselSlider.builder(
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                      scrollDirection: Axis.horizontal,
                                      enlargeCenterPage: true,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.height,
                                      enlargeFactor: 0.4,
                                      viewportFraction: 0.6,
                                      height: 350.h,
                                    ),
                                    itemCount: movies.length,
                                    itemBuilder:
                                        (BuildContext context, int index, _) {
                                      return CustomCard(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            MovieDetailsScreen.routeName,
                                            arguments: movies[index],
                                          );
                                        },
                                        customWidth: 234.w,
                                        customHeight: 351.h,
                                        movie: movies[index],
                                      );
                                    },
                                  ),
                                ),
                                Image.asset("assets/images/watchnow.png"),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  BlocBuilder<MoviesGenreCubit, MoviesStates>(
                    bloc: movieGenreCubit,
                    builder: (context, state) {
                      if (state is MoviesGenreLoading) {
                        return LoadingGenreWidget(mygenre: mygenre);
                      } else if (state is MoviesGenreError) {
                        return ErrorWidget(state.errorMessage);
                      } else if (state is MoviesGenreSuccess) {
                        List<Movie> movies = state.movies;
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    mygenre,
                                    style: HelperFunction.textTheme(context)
                                        .bodyMedium!
                                        .copyWith(fontSize: 20.sp),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          "See More",
                                          style:
                                              HelperFunction.textTheme(context)
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          ThemeColors.yellow),
                                        ),
                                        SizedBox(width: 4.w),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 14.sp,
                                          color: ThemeColors.yellow,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.only(bottom: 120.h),
                              child: SizedBox(
                                height: 220.h,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movies.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 16.w),
                                        child: CustomCard(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              MovieDetailsScreen.routeName,
                                              arguments: movies[index],
                                            );
                                          },
                                          customWidth: 146.w,
                                          customHeight: 220.h,
                                          movie: movies[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
