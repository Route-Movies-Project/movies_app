import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_card.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/info_card.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/screenShot_item.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details';
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              // Background Image
              CachedNetworkImage(
                imageUrl: movie.largeCoverImage,
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
              ),
              // Gradient Overlay
              Container(
                width: double.infinity,
                height: 645.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ThemeColors.black.withValues(alpha: 0.2),
                      ThemeColors.black.withValues(alpha: 0.1),
                      ThemeColors.black,
                    ],
                  ),
                ),
              ),
              // Content
              SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    children: [
                      // App Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 37.w,
                              height: 58.h,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                color: ThemeColors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Container(
                              width: 50.w,
                              height: 58.h,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.bookmark_border),
                                color: ThemeColors.white,
                                onPressed: () {
                                  // Handle bookmark action here
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Spacer for main content
                      const Spacer(),

                      // Play Button
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Movie Title
                      Text(
                        movie.title,
                        style: HelperFunction.textTheme(context).titleLarge,
                      ),

                      SizedBox(height: 10.h),

                      // Year
                      Text(
                        movie.year.toString(),
                        style: HelperFunction.textTheme(context).bodyMedium,
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: CustomElevatedButton(
              onPressed: () {
                // handle watch button
              },
              buttonStyle: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55.h),
                backgroundColor: ThemeColors.red,
                foregroundColor: ThemeColors.white,
              ),
              child: const Text('Watch'),
            ),
          ),
          SizedBox(height: 20.h),
          // Rating Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              info_card(
                text: movie.torrents.length.toString(),
                icon: Icons.favorite,
              ),
              info_card(
                text: movie.runtime.toString(),
                icon: Icons.timelapse,
              ),
              info_card(
                text: movie.rating.toString(),
                icon: Icons.star,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // ScreenShots
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ScreenShots',
                style: HelperFunction.textTheme(context).titleLarge,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          screenShot_item(
            imgeUrl: movie.largeCoverImage,
          ),
          screenShot_item(
            imgeUrl: movie.smallCoverImage,
          ),
          screenShot_item(
            imgeUrl: movie.mediumCoverImage,
          ),
          SizedBox(height: 20.h),
          // Similar Movies
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Similar Movies',
                style: HelperFunction.textTheme(context).titleLarge,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 12.w,
              children: [
                CustomCard(
                  customWidth: 189.w,
                  customHeight: 279.h,
                  movie: movie,
                ),
                CustomCard(
                  customWidth: 189.w,
                  customHeight: 279.h,
                  movie: movie,
                ),
                CustomCard(
                  customWidth: 189.w,
                  customHeight: 279.h,
                  movie: movie,
                ),
                CustomCard(
                  customWidth: 189.w,
                  customHeight: 279.h,
                  movie: movie,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
