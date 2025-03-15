import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_card.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/suggestions_cubit.dart';

class CustomSimilarMovies extends StatelessWidget {
  const CustomSimilarMovies({
    super.key,
    required this.movieDetailsCubit,
    required this.suggestionMovies,
    required this.suggestionMoviesCubit,
    required this.scrollController,
  });

  final ScrollController scrollController;
  final SuggestionCubit suggestionMoviesCubit;
  final List<Movie> suggestionMovies;
  final MovieDetailsCubit movieDetailsCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: suggestionMovies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                duration: const Duration(milliseconds: 500),
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
  }
}
