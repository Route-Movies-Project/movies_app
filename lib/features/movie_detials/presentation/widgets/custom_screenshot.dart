import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/screenShot_item.dart';

class CustomScreenshot extends StatelessWidget {
  const CustomScreenshot({required this.movieDetails, super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ScreenshotItem(
              // ignore: unnecessary_null_comparison
              imgeUrl: movieDetails.largeCoverImage == null ||
                      movieDetails.largeCoverImage.isEmpty
                  ? movieDetails.mediumCoverImage
                  : movieDetails.largeCoverImage,
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
