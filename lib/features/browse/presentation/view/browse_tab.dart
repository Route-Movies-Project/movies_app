import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/browse/presentation/widgets/custom_tab_item.dart';
import 'package:movies_app/features/home/cubit/movies_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_states.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_card.dart';
import 'package:movies_app/features/home/presentation/widgets/loading_widget.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_genre.dart';
import 'package:movies_app/features/movie_detials/presentation/views/movie_details_screen.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: DefaultTabController(
              length: MoviesGenre.movieGenres.length,
              child: TabBar(
                padding: EdgeInsets.only(left: 8.w),
                labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: MoviesGenre.movieGenres
                    .map(
                      (genre) => CustomTabItem(genre: genre),
                    )
                    .toList(),
              ),
            ),
          ),
          BlocBuilder<MoviesCubit, MoviesStates>(
            builder: (context, state) {
              if (state is MoviesLoading) {
                return const LoadingWidget();
              } else if (state is MoviesError) {
                return ErrorWidget(state.errorMessage);
              } else if (state is MoviesSuccess) {
                List<Movie> movies = state.movies;
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: movies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 189.w / 279.h,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MovieDetailsScreen.routeName,
                            arguments: movies[index],
                          );
                        },
                        customWidth: 189.w,
                        customHeight: 279.h,
                        movie: movies[index],
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
