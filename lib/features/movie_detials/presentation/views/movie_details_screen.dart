import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details';
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image with Gradient Overlay
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  movie.largeCoverImage,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeColors.black.withOpacity(0.4),
                    ThemeColors.black.withOpacity(0.6),
                    ThemeColors.black.withOpacity(0.8),
                    ThemeColors.black,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 200.h),
              width: 70.w,
              height: 70.h,
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
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                // App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: ThemeColors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          color: ThemeColors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: ThemeColors.black.withOpacity(0.5),
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

                const SizedBox(height: 20),

                // Movie Title
                Text(
                  movie.title,
                  style: HelperFunction.textTheme(context)
                      .bodyMedium!
                      .copyWith(color: ThemeColors.yellow),
                ),
                const SizedBox(height: 10),

                // Year
                const Text(
                  "2022",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                // Watch Button
                CustomElevatedButton(
                  onPressed: () {
                    // Handle watch action here
                  },
                  buttonStyle: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55.h),
                    backgroundColor: ThemeColors.red,
                    foregroundColor: ThemeColors.white,
                  ),
                  child: const Text('Watch'),
                ),

                const SizedBox(height: 20),

                // Ratings Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Likes
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.amber, size: 22),
                        SizedBox(width: 8),
                        Text("15",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),

                    SizedBox(width: 30),

                    // Duration
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.amber, size: 22),
                        SizedBox(width: 8),
                        Text("90",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),

                    SizedBox(width: 30),

                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 22),
                        SizedBox(width: 8),
                        Text("7.6",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
