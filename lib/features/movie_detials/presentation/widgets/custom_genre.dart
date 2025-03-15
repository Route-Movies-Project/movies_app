import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_genre_card.dart';

class CustomGenre extends StatelessWidget {
  const CustomGenre({required this.movieDetails, super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      child: GridView.builder(
        padding: EdgeInsets.zero,
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
    );
  }
}
