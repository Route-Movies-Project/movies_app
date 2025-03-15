import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({required this.movieDetails, super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
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
    );
  }
}
