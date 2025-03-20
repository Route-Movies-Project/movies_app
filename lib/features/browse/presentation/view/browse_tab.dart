import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
import 'package:movies_app/features/browse/presentation/widgets/custom_tab_item.dart';
import 'package:movies_app/features/home/cubit/movie_genre_index_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_genre_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_states.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_card.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_genre.dart';
import 'package:movies_app/features/movie_detials/presentation/views/movie_details_screen.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final _scrollController = ScrollController();
  int selectedIndex = 0;
  bool isSelected = false;
  final MoviesGenreCubit movieGenreCubit = getIt<MoviesGenreCubit>();
  final MovieGenreIndexCubit movieGenreIndexCubit =
      getIt<MovieGenreIndexCubit>();

  @override
  void initState() {
    super.initState();
    movieGenreCubit.getGenreMovies(
      10,
      MoviesGenre.movieGenres[movieGenreIndexCubit.state],
      isPagination: false,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _scrollController.addListener(
          () {
            if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 200) {
              movieGenreCubit.getGenreMovies(
                10,
                MoviesGenre.movieGenres[selectedIndex],
                isPagination: true,
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: DefaultTabController(
            length: MoviesGenre.movieGenres.length,
            initialIndex: movieGenreIndexCubit.state,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.symmetric(horizontal: 6.w),
              tabs: MoviesGenre.movieGenres
                  .map(
                    (genre) => CustomTabItem(
                      isSelected: movieGenreIndexCubit.state ==
                          MoviesGenre.movieGenres.indexOf(genre),
                      genre: genre,
                    ),
                  )
                  .toList(),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });

                movieGenreCubit.getGenreMovies(
                  10,
                  MoviesGenre.movieGenres[selectedIndex],
                );
              },
            ),
          ),
        ),
        SizedBox(height: 25.h),
        Expanded(
          child: BlocBuilder<MoviesGenreCubit, MoviesStates>(
            builder: (context, state) {
              if (state is MoviesGenreLoading) {
                return const LoadingIndicator();
              } else if (state is MoviesGenreError) {
                return ErrorWidget(state.errorMessage);
              } else if (state is MoviesGenreSuccess) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.only(bottom: 115.h),
                    controller: _scrollController,
                    itemCount: state.movies.length +
                        (movieGenreCubit.hasMoreData ? 2 : 0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 189.w / 279.h,
                    ),
                    itemBuilder: (context, index) {
                      if (index >= state.movies.length) {
                        return const LoadingIndicator();
                      } else {
                        return CustomCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MovieDetailsScreen.routeName,
                              arguments: state.movies[index].id,
                            );
                          },
                          customWidth: 189.w,
                          customHeight: 279.h,
                          movie: state.movies[index],
                        );
                      }
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
