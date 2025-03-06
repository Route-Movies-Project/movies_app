import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:shimmer/shimmer.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.customWidth,
    required this.customHeight,
    required this.movie,
    super.key,
  });
  final Movie movie;
  final double customWidth;
  final double customHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Stack(
        children: [
          SizedBox(
            height: customHeight,
            width: customWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                imageUrl: movie.largeCoverImage,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: const Color(0xFF121312), // Your requested color
                  highlightColor:
                      Colors.grey.shade700, // Adjust for better contrast
                  child: Container(
                    width: customWidth,
                    height: customHeight, // Adjust height as needed
                    decoration: BoxDecoration(
                      color: const Color(0xFF121312), // Same base color
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: ThemeColors.yellow,
                ),
                fit: BoxFit.cover,
                height: customHeight,
                width: customWidth,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: ThemeColors.yellow, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    movie.rating.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
