import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';

class CustomMovieTitle extends StatelessWidget {
  const CustomMovieTitle({required this.movieDetails, super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        movieDetails.title,
        textAlign: TextAlign.center,
        style: HelperFunction.textTheme(context).titleLarge,
      ),
    );
  }
}
