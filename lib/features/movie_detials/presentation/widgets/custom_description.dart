import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({required this.movieDetails, super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
